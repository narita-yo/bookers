class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
    #redirect_to user_path(@user.id)
  end
  def login
    flash[:notice] = "successfully"
    redirect_to user_path(current_user.id)
  end
  def show
  	@user = User.find(params[:id])
  	@books = Book.where(user_id: params[:id])
  	@book = Book.new
  end

  def edit
    if params[:id].to_s != current_user.id.to_s
      redirect_to user_path(current_user.id)
    end

    @user = User.find(params[:id])

  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "successfully"
    else
      flash[:error] = "error"
    end
    redirect_to user_path(user.id)
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
