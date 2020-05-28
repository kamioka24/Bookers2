class RelationshipsController < ApplicationController
	def create
		current_user.follow(params[:other_user])
		redirect_back(fallback_location: root_path)
	end

	def destroy
		current_user.unfollow(params[:other_user])
		redirect_back(fallback_location: root_path)
	end

	def follower
	    user = User.find(params[:other_user])
	    @users = user.following_user
	end

	def followed
		user = User.find(params[:other_user])
	    @users = user.follower_user
	end

	private
end
