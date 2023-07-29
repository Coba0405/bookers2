class UsersController < ApplicationController
 
  def new
    @user = User.new
  end
 
  def index
    @user = current_user
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def create
      @user = User.new
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user.id)
    else
      render :index
    end
  end
  
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    # (user_paramsはuser_i、image等中身の全部を呼び出すコマンド)
    # user＿paramsは
      else
        render :edit
      end
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end 
  end
  
  
  private
   
  def user_params
     params.require(:user).permit(:name,:introduction,:profile_image)
  end
  
  def is_matching_login_user
      user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end