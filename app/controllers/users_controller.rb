class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      #sign_in(@user)
       redirect_to '/'
    else
       redirect_to '/'
    end
  end


  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    #puts YAML::dump(params)
    if @user.update_attributes(user_params)
      #redirect_to users_path, :notice => "User updated."
      return render :json => {:success => true, :update => true} 

    else
      return render :json => {:success => false} 
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

   def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :profile)
  end

end