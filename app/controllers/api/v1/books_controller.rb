class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  def search_by_title; search end
  def search_by_isbn; search end

  def search
    @books = Book.search book_params[:term]
    if @books.any?
      render json: @books, status: :ok
    else
      render json: { msg: "We didn't find any books" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      puts "====== #{params}"
      params.require(:book).permit(:title, :author_id, :isbn, :price, :short_description, :term)
    end

end
