class UsersController < ApplicationController
  def top
  end

  def create
    @post_book = Book.new(post_book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
  	   redirect_to user_path(@user.id), notice: "You have creatad book successfully."
    else
      render "show"
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_book = PostBook.new
    #@post_books = @user.post_books.page(params[:page]).reverse_order
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
