class UsersController < ApplicationController

before_action :logged_in_user,only: [:edit,:update]
before_action :correct_user,only: [:edit,:update]  
before_action :check_for_logout, only: [:new]


	def new
		@user = User.new
  end

	def show
		@user = User.find(params[:id])
	end
	
	def index
		@users=User.all
	end


def create
@user = User.new(user_params)
if @user.save
log_in @user
flash[:success] = "User successfully logged in!"
redirect_to @user
else
render 'new'
end
end

def edit
@user = User.find(params[:id])
end



def update
@user = User.find(params[:id])
if @user.update_attributes(user_params)
flash[:success] = "Profile updated"
redirect_to @user
else
render 'edit'
end
end



	def check_for_logout
				unless logged_out?
					flash[:danger]="please log out first"
					redirect_to	user_path(current_user)
				end
		end

private
def user_params
params.require(:user).permit(:name,:email,:password,
:password_confirmation,:image)
end

def logged_in_user
unless logged_in?
flash[:danger] = "Please log in."
redirect_to login_url
end


def correct_user
@user = User.find(params[:id])
# redirect_to(root_url) unless current_user?(@user)
redirect_to(root_url) unless @user == current_user
end

def about
		@users = User.all
end

end
end
