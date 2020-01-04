class AuthorsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		# @authors = Author.all
		# respond_to do |format|
  #   	format.html  # index.html.erb
  #   	format.json  { render :json => @authors }
  #   	format.xml { render xml: @authors }
  # 	end
  	render json: @authors = Author.all
	end

	# def new
	# 	@author = Author.new
	# end

	# def edit
 #  	@author = Author.find(params[:id])
	# end

	def create
		@author = Author.new(author_params)
		puts author_params
		if(@author.save)
			render json: @author, status: :created, location: @author
		else
			render json: @author.errors, status: :unprocessable_entity
		end
		# @author = Author.new(author_params)
		# # @author.books << Book.find(params[:author][:book_ids])
		# if @author.save
		# 	flash[:success] = "Author created successfully."
		# 	redirect_to authors_path
		# else
		# 	render 'new'
		# end
	end

	def update
		@author = Author.find(params[:id])
		if(@author.update(author_params))
			render json: @author
		else
			render json: @author.errors, status: :unprocessable_entity
		end
  	# @author = Author.find(params[:id])
  	# if @author.update(author_params)
   # 		flash[:success] = "Author updated successfully."
   # 		redirect_to @author
 		# else
   #  	render 'edit'
  	# end
	end

	def show
		@author = Author.find(params[:id])
		render json: @author
  #   @author = Author.find(params[:id]).to_json(only: [:first_name, :last_name], :include => :books)
		# respond_to do |format|
  #   	format.html  # index.html.erb
  #   	format.json  { render :json => @author }
  # 	end
  end

  def destroy
  	@author = Author.find(params[:id])
  	@author.destroy
  	render json: {status: 204}
  	# @author = Author.find(params[:id])
  	# @author.destroy
	  # redirect_to authors_path
	end

	private
		def author_params
    	params.require(:author).permit(:first_name, :last_name, :date_of_birth)
  	end
end
