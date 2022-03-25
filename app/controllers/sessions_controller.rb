class SessionsController < ApplicationController
  def new
    session.clear
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Verify your email and password please'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to :login
  end
end
