class PostBooksController < ApplicationController
  before_action :authenticate_user!
  before_action :current_book, only:[:edit, :update]

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
    @user = User.find(current_user.id)
  end

  def show
    @my_book = PostBook.find(params[:id])
    @post_book = PostBook.new
    @user = @my_book.user
  end

  def edit
    @post_book = PostBook.find(params[:id])
  end

  def update
    @post_book = PostBook.find(params[:id])
    if @post_book.update(post_book_params)
       redirect_to post_book_path(@post_book), notice: "You have updated book successfully."
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

  def current_book
    @post_book = PostBook.find(params[:id])
    if @post_book.user != current_user
       redirect_to post_book_path
    end
  end

  def post_book_params
    params.require(:post_book).permit(:title, :body, :user_id)
  end

end