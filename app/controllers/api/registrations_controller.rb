class Api::RegistrationsController < Devise::RegistrationsController


  #load_and_authorize_resource
  load_and_authorize_resource :class => Api::RegistrationsController, only: :index
  #authorize_resource  :class => Users::RegistrationsController
  before_filter :authenticate_user!, :except => [:create, :show]
  
  def index

    @users = User.all
    
  end

  def edit

    super
    
  end

  def show
    render :json => {:info => "Current User", :user => current_user}, :status => 200
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      sign_in(@user)
       redirect_to '/'
    else
       redirect_to '/'
    end
  end

  def update    
    User.update(current_user.id, user_params)
    return render :json => {:success => true, :update => true} 

  end

  def destroy
    #respond_with :api, 
    User.find(current_user.id).destroy
    redirect_to '/'
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :profile)
  end
end