class SessionsController < ApplicationController
  
  def new
  end

  def create
    buddy = Buddy.find_by_email( params[:session][:email] )
    if( buddy && buddy.authenticate( params[:session][:password] ) )
      sign_in buddy
      redirect_to buddy
    else
      flash.now[:error] = "Incorrect email/password combination."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
