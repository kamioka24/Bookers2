class BookCommentsController < ApplicationController
	def create
		@post_book = PostBook.find(params[:post_book_id])
		@book_comment = current_user.book_comments.new(book_comment_params)
		@book_comment.post_book_id = @post_book.id
		@book_comment.user_id = current_user.id
		if @book_comment.save
			redirect_back(fallback_location: root_path)
		else
			@my_book = @post_book
			@user = @post_book.user
			render 'post_books/show'
		end
	end

	def destroy
		@book_comment = BookComment.find(params[:post_book_id])
		@book_comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
