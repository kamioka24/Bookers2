class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :b_user, only:[:edit, :update]
  def top
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @post_book = PostBook.new
  end

  def show
    @user = User.find(params[:id])
    @post_book = PostBook.new
    @post_books = @user.post_books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def b_user
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to user_path(current_user)
    end
  end

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
