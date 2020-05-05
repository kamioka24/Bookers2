class UsersController < ApplicationController
  def top
  end

  def index
    @users = User.all
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
    @user.update(user_params)
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image_id)
  end

end
