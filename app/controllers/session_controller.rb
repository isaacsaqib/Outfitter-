class SessionController < ApplicationController

  def new
  end

  def create
    # finds the user by the given email
    user = User.find_by(email: params[:email])
    # if we found the user and they gave us the right password
    if user && user.authenticate(params[:password])
      # store user id in session
      session[:user_id] = user.id
      redirect_to("/")
    else
      # rerender the login form
      render(:new)
    end
  end

  def destroy
    # we can set the session user_id to nil
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
