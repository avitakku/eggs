class GoodsServicesController < ApplicationController

    @@logged_in_user = "94213"
  
    def show
      id = params[:id]
      @good_service = GoodsAndService.find(id)
    end

    def new
    end
  
    def index
      
      @logged_in_user = @@logged_in_user

      @all_categories = [ "Good", "Service" ]
      @categories_to_show = params[:categories]&.keys || @all_categories

      @first_degree_connections = []
      @second_degree_connections = []

      users = UserInformation.where(user_id: @@logged_in_user)
      @user = nil
      users.each do |user|
          @user = user
      end
      
      @user.friends.each do |friend_id|
          upperFriend = UserInformation.where(user_id: friend_id)
          friend = nil
          @first_degree_connections.push(friend_id)
      end

      @first_degree_connections.each do |first_degree_friend|
        curr_friend = UserInformation.where(user_id: first_degree_friend)
        curr_friend.each do |user|
          user.friends.each do |friend_id|
            upperFriend = UserInformation.where(user_id: friend_id)
            friend = nil
            if @first_degree_connections.include?(friend_id)
            else
              @second_degree_connections.push(friend_id)
            end
          end
        end  
      end
      
      @goods_services = if params[:query].present?
        GoodsAndService.where("name LIKE ?", "%#{params[:query]}%")
      else
        GoodsAndService.all
      end

      @goods_services = @goods_services.where(category: category_ids_from_names(@categories_to_show))

      all_users = UserInformation.all
      
      @no_degree_connections = []
      all_users.each do |user|
        unless @first_degree_connections.include?(user.user_id) or @second_degree_connections.include?(user.user_id)
          @no_degree_connections.push(user.user_id)
        end
      end

      @no_conn_goods_services = []
      @no_degree_connections.each do |user_id|
        GoodsAndService.where(user_id: user_id).each do |good|
          unless user_id == @@logged_in_user
            if @goods_services.include?(good)
              @no_conn_goods_services.push(good)
            end
          end
        end
      end

      @first_conn_goods_services = []
      @first_degree_connections.each do |user_id|
        GoodsAndService.where(user_id: user_id).each do |good|
          unless user_id == @@logged_in_user
            if @goods_services.include?(good)
              @first_conn_goods_services.push(good)
            end
          end
        end
      end

      @second_conn_goods_services = []
      @second_degree_connections.each do |user_id|
        GoodsAndService.where(user_id: user_id).each do |good|
          unless user_id == @@logged_in_user
            if @goods_services.include?(good)
              @second_conn_goods_services.push(good)
            end
          end
        end
      end

      @no_conn_goods_services.each do |good|
        puts good.name
      end

    end
  
    def create
      goods = params[:goods_service]
      name = goods[:name]
      category = goods[:category]
      description = goods[:description]
      puts name
      puts category
      puts description 
      @good_service = GoodsAndService.create!(user_id: @@logged_in_user, name: name, category: category, description: description, created_at: Time.new, updated_at: Time.new)
      flash[:notice] = "Goods/Service was successfully added."
      redirect_to controller: :profile, action: :index
    end
  
    before_action :set_goods_service, only: [:show, :edit, :update, :destroy]

    def edit
        @goods_service = GoodsAndService.find(params[:id])
    end
      

    def update
        @goods_service = GoodsAndService.find(params[:id])
      
        if @goods_service.update(goods_service_params)
          flash[:notice] = "Goods/Service was successfully updated."
          redirect_to controller: :profile, action: :index
        else
          render :edit
        end
      end
  
    def destroy
        @goods_service = GoodsAndService.find(params[:id])
        @goods_service.destroy
        flash[:notice] = "Goods/Service was deleted."
        redirect_to controller: :profile, action: :index
    end

    private

    def set_goods_service
      @goods_service = GoodsAndService.find(params[:id])
    end
    
    def goods_service_params
        params.require(:goods_and_service).permit(:name, :category, :description)
    end

      
    def category_ids_from_names(names)
      names.map { |name| name == "Good" ? 0 : 1 }
    end
  end
  