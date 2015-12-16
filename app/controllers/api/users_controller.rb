class Api::UsersController < Api::BaseController
	def followers
		@followers =  User.find(params[:current_user]).followers
		respond_with @followers
	end

	def following
		@following = User.find(params[:current_user]).all_follows
		respond_with @following
	end

	def unfollow
		follower = User.find(params[:current_user])
		unfollowed = User.find(params[:user_id])
		respond_with follower.stop_followning(unfollowed)
		if(!follower.following?(followed))
			respond_with status: 201
		end
	end

	def follow
		follower = User.find(params[:current_user])
		followed = User.find(params[:user_id])
		if(follower.following?(followed))
			respond_with status: 201
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end
	
	
end