class SessionsController < ApplicationController

def create
  begin
    @user = User.from_omniauth(request.env['omniauth.auth'])
    #flash[:warning] = "There was an error while trying to authenticate you..."
    session[:user_id] = @user.id
    flash[:success] = "Welcome #{@user.name}, Here is your data!"
  rescue StandardError => e
    puts e.inspect
    flash[:warning] = "There was an error while trying to authenticate you..."
  end
  redirect_to root_path
end


def destroy
  if current_user
    session.delete(:user_id)
    flash[:success] = "Bye! See you soon!"
  end
  redirect_to root_path
end

end
