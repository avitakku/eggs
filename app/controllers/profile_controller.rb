class ProfileController < ApplicationController

    def index
        @user = UserInformation.where(user_id: "94213")
        @goods_services = GoodsAndService.where(user_id: "94213")
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
    end

end