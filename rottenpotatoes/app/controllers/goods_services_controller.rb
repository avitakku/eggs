class GoodsServicesController < ApplicationController
  
    def show
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
  
    def new
    end
  
    def create
      name = params[:name]
      category = params[:category]
      description = params[:description]
      print name
      print category
      print description
      redirect_to profile_path
    end
  
    def edit
    end
  
    def update
      if @goods_service.update(goods_service_params)
        flash[:notice] = "Goods/Service was successfully updated."
        redirect_to @goods_service
      else
        render :edit
      end
    end
  
    def destroy
      @goods_service.destroy
      flash[:notice] = "Goods/Service was deleted."
      redirect_to goods_services_path
    end

    def profile
        @user = UserInformation.where(user_id: "94213")
        @goods_services = GoodsAndService.where(user_id: "94213")
    end

    private
  
    def set_goods_service
      @goods_service = GoodsAndService.find(params[:id])
    end
  
    def goods_service_params
      params.require(:goods_service).permit(:name, :category, :description)
    end
  
    def category_ids_from_names(names)
      names.map { |name| name == "Good" ? 0 : 1 }
    end
  end
  