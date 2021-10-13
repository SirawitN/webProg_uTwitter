class MainController < ApplicationController
  include MainConcern
  
  before_action :is_logged_in, only: %i[ feed profile ]
  before_action :set_current_user
  before_action :set_user, only: %i[ feed ]
  before_action :set_user_by_name, only: %i[ profile ]
  before_action only: %i[ feed ] do
    if @user
      is_the_right_user(@user.id)
    else
      is_the_right_user(-1)
    end
  end

  def logIn
    if session[:user_id]
      redirect_to feed_path(session[:user_id])
    end
  end

  def register
    @user = User.new
  end

  def findUser
    #puts "email, pass = #{params[:email]}, #{params[:password]}"
    @user = User.find_by(email: params[:email]).authenticate(params[:password]) rescue nil
      respond_to do |format|
          if @user
            puts "Found"
            format.html {redirect_to feed_path(@user)}
            session[:user_id] = @user.id
          else 
            puts "Not found"
            flash.alert = "Log in failed, wrong email or password !!"
            format.html { redirect_to main_path}   #<<-------------------- 
          end
      end
  end

  def feed
  end

  def profile
  end

  def logout
    session[:user_id] = nil
    redirect_to main_path
  end

  private
    def set_user_by_name
      @user = User.find_by(name: params[:name])
    end

    def set_user
      @user = User.find(params[:id])
    end
end
