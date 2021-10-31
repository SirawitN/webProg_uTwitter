class LikesController < ApplicationController
	include MainConcern

	before_action :is_logged_in
	before_action :set_current_user
	before_action :find_post
	before_action :find_like, only: %i[ destroy ]
  
  	def create
  		if !already_liked 
  			@post.likes.create(user_id: @currentUser.id)
  			puts "liked"
  		end
  		redirect_back(fallback_location: feed_path(@currentUser))
  	end

  	def destroy
  		@like.destroy
  		redirect_back(fallback_location: feed_path(@currentUser))
  	end


  	def already_liked
  		return Like.where(user_id: @currentUser.id, post_id: @post.id).exists?
  	end


  	private

    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_like
     	@like = @post.likes.find_by(user_id: @currentUser.id)
    end
end
