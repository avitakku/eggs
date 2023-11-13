class GoodsServicesController < ApplicationController

    @@logged_in_user = "94213"
  
    def show
      id = params[:id]
      @good_service = GoodsAndService.find(id)
    end

    def new
    end
  
    def index
      @all_categories = [ "Good", "Service" ]
      @categories_to_show = params[:categories]&.keys || @all_categories
      
      @goods_services = if params[:query].present?
        GoodsAndService.where("name LIKE ?", "%#{params[:query]}%")
      else
        GoodsAndService.all
      end

  
      @goods_services = @goods_services.where(category: category_ids_from_names(@categories_to_show))
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
  