class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
    # @bookmarks = @list.bookmarks
    # @bookmark = Bookmark.new
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # @bookmark = Bookmark.new(bookmark_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @list = List.find(params[:list_id])
    # @bookmark.list = @list
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      # redirect_to list_path(@list)
      redirect_to @bookmark.list
    else
      # render :new
      # render "lists/show", status: :unprocessable_entity
      render :new
    end
  end

  def edit
  end

  def update
    @bookmark.update(bookmark_params)

    redirect_to bookmark_path(@bookmark)
  end

  def destroy
    @bookmark.destroy

    redirect_to @bookmark.list
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:id, :comment, :movie_id, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
