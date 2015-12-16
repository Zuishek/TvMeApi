class Api::UsersController < Api::BaseController
	def followers
		@followers =  User.find(params[:id]).followers
		respond_with @followers
	end

	def following
		@following = User.find(params[:id]).all_following
		respond_with @following
	end

	def unfollow
		follower = User.find(params[:current_user])
		unfollowed = User.find(params[:user_id])
		follower.stop_followning(unfollowed)
		if(!follower.following?(followed))
			respond_with status: 201
		end
	end

	def follow
		follower = User.find(params[:current_user])
		followed = User.find(params[:user_id])
		follower.follow(followed)
		if(follower.following?(followed))
			respond_with status: 201
		end
	end

	def show
		@user = User.find(params[:id])
		respond_with @user
	end

	def index
		@users = User.all
		respond_with @users
	end
	
	
end