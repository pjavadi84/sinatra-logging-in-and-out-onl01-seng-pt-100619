class Helpers
  def self.current_user(session)
    @user = User.find(session[:user_id])
    # binding.pry
  end
  
  def self.is_logged_in?(session)
    if @user
      !!session[:user_id]
    else
      !session[:user_id]
    end
  end

end