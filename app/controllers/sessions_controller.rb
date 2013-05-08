class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user #not working yet which breaks site 
      redirect_to user # Sign the user in and redirect to the user's show page.
    else
      flash.now[:error] = 'Invalid email/password combination' # take out "now" to check flash test
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
