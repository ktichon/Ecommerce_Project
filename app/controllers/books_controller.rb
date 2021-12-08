class BooksController < ApplicationController
  def index
    @books = Book.includes(:author).includes(:genres).includes(image_blob: { attachments: :blob }).order(:name).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @keywords = params[:keywords]
    @genre = params[:type]
    wildcardSearch = "%#{@keywords}%"
    books = Book.includes(image_blob: { attachments: :blob }).includes(:author).includes(:genres).where("name LIKE ? ", wildcardSearch)
    if  params[:type] != "All"
      genres = Genre.find_by(genre_name: @genre)
      books = books.joins(:book_genres).where("books.id = book_genres.book_id").where("book_genres.genre_id = ?", genres.id)
    end
    @books = books.order(:name).page(params[:page])
  end
end
