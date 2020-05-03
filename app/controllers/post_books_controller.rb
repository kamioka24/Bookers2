class PostBooksController < ApplicationController

  def create
    @post_book = Book.new(post_book_params)
    @post_book.save
    redirect_to user_path(user.id)
  end

  def index
    @post_books = PostBook.all
  end

  def show
  end

  def edit
    @post_book = PostBook.find(params[:id])
  end

  def update
    @post_book = PostBook.find(params[:id])
    if @post_book.update(post_book_params)
       redirect_to user_path(user.id), notice: "You have updated book successfully."
    else
       render "edit"
    end
  end

  def destroy
  	@post_book = PostBook.find(params[:id])
    @post_book.destroy
    redirect_to post_books_path
  end

end
