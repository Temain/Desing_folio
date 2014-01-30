class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    @authenticated = user && user.authenticate(params[:session][:password])
    if @authenticated
    else
      flash.now[:error] = 'Invalid email/password combination'
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
  end
end
