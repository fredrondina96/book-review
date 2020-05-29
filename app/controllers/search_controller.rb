class SearchController < ApplicationController

  def index
    @book = Book.load_book_info(params[:title])
  end

end
