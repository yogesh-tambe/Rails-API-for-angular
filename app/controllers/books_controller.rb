class BooksController < ApplicationController
	
	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def edit
  	@book = Book.find(params[:id])
	end

	def create
	  @book = Book.new(book_params)
	  @book.authors << Author.find(params[:book][:author_ids])
	  if @book.save
	  	flash[:success] = "Book created successfully."
	  	redirect_to books_path
	  else
	  	render 'new'
	  end
	end

	def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		flash[:success] = "Book updted successfully."
    	redirect_to @book
  	else
    	render 'edit'
  	end
  end

	def show
    @book = Book.find(params[:id])
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
	  redirect_to books_path
	end

	private
  def book_params
    params.require(:book).permit(:title)
  end
end
