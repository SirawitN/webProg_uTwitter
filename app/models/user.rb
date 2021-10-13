class User < ApplicationRecord
	has_secure_password
	has_many :posts

	has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
	has_many :followees, through: :followed_users
	has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
	has_many :followers, through: :following_users

	validates :email, presence: true, uniqueness: true 
	validates :name, presence: true, uniqueness: true 
	validates :password, length: {minimum: 6}, confirmation: true
	validates :password_confirmation, presence: true


	def feedPosts
		return posts.or(Post.where(user: followed_users.pluck(:followee_id))).order(created_at: :desc)
	end

	def posts
		return Post.where(user: self)
	end
end
