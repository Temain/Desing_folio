class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        sign_in(user)
        #format.html { redirect_to root_path }
        format.js { render :js => "window.location = '/'" }
      else
        flash.now[:error] = 'Invalid email/password combination'
        format.js
      end
    end
  end

  def destroy
    sign_out
    respond_to do |format|
      #format.html { redirect_to controller: 'microposts', action: 'index', remote: true }
      format.js { render :js => "window.location = '/'" }
    end
  end
end
