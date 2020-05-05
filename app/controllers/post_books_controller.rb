class PostBooksController < ApplicationController

  def create
    @post_book = PostBook.new(post_book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
       redirect_to post_book_path(@post_book.id), notice: "You have creatad book successfully."
    else
      @post_books = PostBook.all
      @user = User.find(current_user.id)
      render "index"
    end
  end

  def index
    @post_book = PostBook.new
    @post_books = PostBook.all
  end

  def show
    @post_book = PostBook.find(params[:id])
  end

  def edit
    @post_book = PostBook.find(params[:id])
  end

  def update
    @post_book = PostBook.find(params[:id])
    if @post_book.update(post_book_params)
       redirect_to user_path(current_user.id), notice: "You have updated book successfully."
    else
       render "edit"
    end
  end

  def destroy
  	@post_book = PostBook.find(params[:id])
    @post_book.destroy
    redirect_to post_books_path
  end

  private

  def post_book_params
    params.require(:post_book).permit(:title, :body, :user_id)
  end

end