require 'themoviedb'

class MoviesController < ApplicationController
  Tmdb::Api.key("a5b6184c80781706fbb134c3a33bf034")
  Tmdb::Api.language("fr")

  def index
    if params[:search].present?
      @search = Tmdb::Search.new
      @search.resource('movie') # determines type of resource
      @search.query(params[:search]) # the query to search against
      @movies = @search.fetch
    else
      @movies =Tmdb::Movie.popular
    end
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @library = Library.find_by(db_id: params[:id])
    if @library.nil?
      @library_exists = false
    else
      @library_exists = true
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:id, :title, :description, :year, :rating, :image, :search)
  end
end
