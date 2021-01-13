class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:create] = "Book was successfully created."
      redirect_to "/books/#{@book.id}"
    else
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:update] = "Book was successfully updated."
      redirect_to "/books/#{book.id}"
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:destroy] = "Book was successfully destroyed."
      redirect_to "/books"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end