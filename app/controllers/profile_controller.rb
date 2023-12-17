class ProfileController < ApplicationController
    @@logged_in_user = "94213"

    def index
        # 'find_by' not working to find user by user_id so using 'where' with a for loop instead
        users = UserInformation.where(user_id: @@logged_in_user)
        @user = nil
        users.each do |user|
            @user = user
        end

        @goods_services = GoodsAndService.where(user_id: @@logged_in_user)
        
        @friends = []
        @user.friends.each do |friend_id|
            upperFriend = UserInformation.where(user_id: friend_id)
            friend = nil
            upperFriend.each do |friend|
                @friends.push(friend)
            end
        end

    end

    def users
        @logged_in_user = @@logged_in_user
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

        target_id = params[:user_id]

        users = UserInformation.where(user_id: @@logged_in_user)
        user = nil
        users.each do |x|
            user = x
        end

        friends = user.friends
        
        if (friends.include? friend_id) or (friend_id.eql?(@@logged_in_user))
            flash[:notice] = "You are already friends with this user!"
            redirect_to controller: :profile, action: :index

        elsif (not(target_id == friend_id))
            flash[:notice] = "Incorrect Friend Key!"
            redirect_to controller: :profile, action: :index

        else
            # add friend to logged in user's friend list
            friends.push(friend_id)
            user.update(friends: friends)

            users = UserInformation.where(user_id: friend_id)
            user2 = nil
            users.each do |x|
                user2 = x
            end
            
            # add logged in user to friend's friend list
            user2_friends = user2.friends
            user2_friends.push(@@logged_in_user)
            user2.update(friends: user2_friends)

            redirect_to controller: :profile, action: :index

        end
    
    end

    def destroy
        id = params[:id]

        # remove friend from logged in user's friend list
        users = UserInformation.where(user_id: @@logged_in_user)
        user = nil
        users.each do |x|
            user = x
        end
        
        friends = user.friends
        friends.delete(id)
        user.update(friends: friends)
        
        # remove logged is user from the other user's friend list as well
        users = UserInformation.where(user_id: id)
        user2 = nil
        users.each do |x|
            user2 = x
        end

        user2_friends = user2.friends
        user2_friends.delete(@@logged_in_user)
        user2.update(friends: user2_friends)

        redirect_to controller: :profile, action: :index
    end

end