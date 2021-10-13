module MainConcern
	extend ActiveSupport::Concern

	def is_logged_in
    if !session[:user_id]  #check nil
      flash[:alert] = "Please login before making any action !!!"
      redirect_to main_url
    end
  end

  def is_the_right_user(user_id)
    #puts "session = #{session[:user_id]},  user_id = #{user_id}"
    if(session[:user_id] != user_id)
    	redirect_back fallback_location: main_path, alert: "Access denied!!"
    end
   end

   def set_current_user
    @currentUser = User.find(session[:user_id]) rescue nil
   end
end