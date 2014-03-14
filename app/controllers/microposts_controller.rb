class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy, :add_comment, :delete_comment]
  before_filter :check_for_back, only: [:create, :update]
  before_filter :when_logged_in, only: [:edit, :update, :new, :create, :destroy, :add_comment, :delete_comment]

  # GET /microposts
  def index
    @category = Category.find(params[:category]) unless params[:category].nil?
    @microposts = if @category
      @category.microposts
    else
      Micropost.search(params[:search])
    end

    @microposts = @microposts.includes(:user).paginate(page: params[:page], per_page: 5)
    if request.xhr?
      respond_to do |format|
        format.js
      end
    end
  end

  # GET /microposts/1
  def show
    respond_to do |format|
      format.js { render action: 'show' }
    end
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
    @categories = Category.all
  end

  # GET /microposts/1/edit
  def edit
    @categories = Category.all
    respond_to do |format|
      format.js
    end
  end

  # POST /microposts
  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user = current_user

    respond_to do |format|
      if @micropost.save
        format.js { redirect_to @micropost }
      else
        format.js { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /microposts/1
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost }
      else
        format.js { render action: 'edit' }
      end
    end
  end

  # DELETE /microposts/1
  def destroy
    @micropost.destroy
    render :js => "window.location = '/'"
    #respond_to do |format|
    #  format.html { redirect_to microposts_path, method: :get }
    #end
  end

  #POST /microposts/1/add_comment
  def add_comment
    comment = Comment.new(comment_params)
    comment.user = current_user
    respond_to do |format|
      if comment.save
        @micropost.comments << comment
        format.js { redirect_to @micropost }
      else
        format.js { render action: 'show' }
      end
    end
  end

  #DELETE /microposts/1/delete_comment/2
  def delete_comment
    @comment = Comment.find(params[:comment_id])
    respond_to do |format|
      if @comment.destroy
        format.js { redirect_to @micropost, status: 303 }
      else
        format.js { render action: 'show' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:title, :content, :category_ids => [])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def check_for_back
      unless params[:back].blank?
        redirect_to action: 'index', remote: true
      end
    end

    def when_logged_in
      unless signed_in?
        redirect_to controller: :sessions, action: :new, remote: true
      end
    end
end
