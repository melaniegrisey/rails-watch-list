class BookmarksController < ApplicationController
  def new
    @movie = Movie.new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@bookmark)
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @movie = Movie.find(params[:id])
    @bookmark = Bookmark.new
  end

  def destroy
    @movie = Movie.find(params[:id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@movie)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
