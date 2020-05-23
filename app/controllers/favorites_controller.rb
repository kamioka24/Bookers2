class FavoritesController < ApplicationController
	def create
		@post_book = PostBook.find(params[:post_book_id])
		@favorite = current_user.favorites.new(post_book_id: params[:post_book_id])
		@favorite.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@post_book = PostBook.find(params[:post_book_id])
		@favorite = current_user.favorites.find_by(post_book_id: @post_book.id)
		@favorite.destroy
		redirect_back(fallback_location: root_path)
	end
end