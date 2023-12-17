class ProfileController < ApplicationController
    before_action :set_logged_in_user
  
    def index
      # 'find_by' not working to find user by user_id so using 'where' with a for loop instead
      users = UserInformation.where(user_id: @logged_in_user)
      @user = users.first # Use 'first' to get the first matching user or nil if not found
  
      @goods_services = GoodsAndService.where(user_id: @logged_in_user)
      
      @friends = []
      @user.friends.each do |friend_id|
        friend = UserInformation.find_by(user_id: friend_id)
        @friends.push(friend) if friend
      end
    end
  
    def users
      @all_users = if params[:query].present?
        UserInformation.where("name LIKE ?", "%#{params[:query]}%")
      else
        UserInformation.all
      end
    end
  
    def show
      id = params[:id]
      @user = UserInformation.where(user_id: id)
    end
  
    def create
      keys = params[:profile]
      friend_id = keys[:friend_key]
      
      user = UserInformation.find_by(user_id: @logged_in_user)
  
      friends = user.friends
      
      if (not(friends.include? friend_id)) and (not(friend_id.eql?(@logged_in_user)))
  
        # add friend to logged in user's friend list
        friends.push(friend_id)
        user.update(friends: friends)
  
        user2 = UserInformation.find_by(user_id: friend_id)
            
        # add logged in user to friend's friend list
        user2_friends = user2.friends
        user2_friends.push(@logged_in_user)
        user2.update(friends: user2_friends)
      end
  
      redirect_to controller: :profile, action: :index
    end
  
    def destroy
      id = params[:id]
  
      # remove friend from logged in user's friend list
      user = UserInformation.find_by(user_id: @logged_in_user)
      
      friends = user.friends
      friends.delete(id)
      user.update(friends: friends)
      
      # remove logged in user from the other user's friend list as well
      user2 = UserInformation.find_by(user_id: id)
  
      user2_friends = user2.friends
      user2_friends.delete(@logged_in_user)
      user2.update(friends: user2_friends)
  
      redirect_to controller: :profile, action: :index
    end
  
    private
  
    def set_logged_in_user
      @logged_in_user = session[:user_id] # Assuming you store user_id in the session during login
    end
  end
  