class Api::PostsController < Api::BaseController
        before_action :authenticate_user!, only: :index
	def index
		@posts = Post.all
		respond_with @posts
	end

        def show
                @post = Post.find(params[:id])
                respond_with @post
        end

	def create
        if(!User.where(id: params[:current_user]).blank?)
        	post = Post.new
        	post.user = current_user
        	post.wall_id = params[:wall_id]
        	post.show_name = params[:post_show_name]
        	post.imdb_link = params[:post_imdb_link]
        	post.text = params[:post_text]
        	if(post.save)
        		respond_with status: 201
        	else
        		respond_with status: 422
        	end
        else
        	respond_with with status: 422
        end
	end

	def destroy
		respond_with Post.destroy(params[:id])
	end

end