class SessionsController < ApplicationController
	before_action :check_for_logout, only: [:new] 


 def new
  end


def create
user = User.find_by(email: params[:session][:email].downcase)
if user && user.authenticate(params[:session][:password])
log_in user
redirect_to user
else
flash.now[:danger] = 'Invalid email/password combination'
render 'new'
def correct_user
@user = User.find(params[:id])
# redirect_to(root_url) unless current_user?(@user)
redirect_to(root_url) unless @user == current_user
end
end
end

def destroy
log_out
redirect_to root_url
end


	def check_for_logout
				unless logged_out?
					flash[:danger]="please log out first"
					redirect_to	user_path(current_user) 
				end
		end
				

end
