class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :update]

 def edit
  @user = User.find(params[:id])
 end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
     if @user.save
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
     else
      render :edit
     end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @books = Book.all
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :caption)
  end

  def correct_user
      @user = User.find(params[:id])
      unless @user==current_user
      redirect_to user_path(current_user)
      end
  end

end