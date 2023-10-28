class GoodsServicesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def profile
  end 

  def index
    @all_categories = GoodsService.all_categories
    @title = params[:sort] == 'title' ? 'hilite bg-warning' : ''
    @release = params[:sort] == 'release_date' ? 'hilite bg-warning' : ''

    if params[:home]
      session[:sort] = params[:sort] if params[:sort]

      if params[:categories].present?
        session[:categories] = params[:categories]
        @categories_to_show = params[:categories].keys
        @goods_services = GoodsService.with_categories(@categories_to_show)
      else
        session[:categories] = []
        @categories_to_show = []
        @goods_services = GoodsService.all
      end

      if params[:sort] == 'title'
        @goods_services = GoodsService.order(:title).with_categories(@categories_to_show)
      elsif params[:sort] == 'release_date'
        @goods_services = GoodsService.order(:release_date).with_categories(@categories_to_show)
      end
    else
      if session[:categories].present?
        @categories_to_show = session[:categories].keys
        @goods_services = GoodsService.with_categories(@categories_to_show)
      else
        @categories_to_show = []
        @goods_services = GoodsService.all
      end

      if session[:sort] == 'title'
        @goods_services = GoodsService.order(:title).with_categories(@categories_to_show)
      elsif session[:sort] == 'release_date'
        @goods_services = GoodsService.order(:release_date).with_categories(@categories_to_show)
      end
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def search_directors
    puts "Inside search_directors"
    @movie = Movie.find(params[:id])
    puts "@movie.director: #{@movie.director}"
    if @movie.director.blank?
      flash[:notice] = "'#{@movie.title}' has no director info"
      redirect_to movies_path and return 
    end
    @movies = Movie.where(director: @movie.director).where.not(id: @movie.id)
    puts "Queried movies with same director: #{@movies.inspect}"
    render :search_directors
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def goods_service_params
    params.require(:goods_service).permit(:title, :category, :description, :release_date, :connection)
  end
  
end
