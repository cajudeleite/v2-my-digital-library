class LibraryController < ApplicationController
  def index
    if params[:search].present?
      @library = Library.where("title ILIKE ?", "%#{params[:search]}%")
    else
      @library = Library.all
    end
  end

  def new
  end

  def create
    @library = Library.new(library_create_params)
    if @library.save
      redirect_to library_index_path
    else
      render 'new'
    end
  end

  def destroy
    @library = Library.find(params[:id])
    @library.destroy
    redirect_to library_index_path
  end

  private

  def library_params
    params.require(:library).permit(:id, :title, :overview, :poster_path, :backdrop_path, :db_id, :search)
  end

  def library_create_params
    params.permit(:title, :overview, :poster_path, :backdrop_path, :db_id)
  end

end
