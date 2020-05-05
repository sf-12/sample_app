class UsersController < ApplicationController
  
  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # POST 
  def create
    # User.create(params[:user])
    @user = User.new(user_params)
    if @user.save
      # Success (valid params)
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      
      # GET "/user/#{@user.id}"
      redirect_to @user
      
      
    else
      # Failue (boy valid params)
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end