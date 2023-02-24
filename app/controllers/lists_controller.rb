class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    # @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :image)
  end
end
