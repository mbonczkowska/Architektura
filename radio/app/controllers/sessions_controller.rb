class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  def create
    man = Man.from_omniauth(env["omniauth.auth"])
    session[:man_id] = man.id
    redirect_to root_url
  end

  def destroy
   if current_user
      flash[:notice] = 'You were logged out.'
      sign_out_and_redirect current_user
    else
      redirect_to root_path
    end
     if current_man
       session[:man_id] = nil
     end
  end
end

