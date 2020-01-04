module BookInfo
  module V1
    class Books < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :books do

	      desc 'create a new book'
				params do
	  			requires :title, type: String
				end
				post do
	  			Book.create!({ title:params[:title], author_ids:params[:author_ids]})
				end

  			desc 'Return list of books'
  			get do
    			books = Book.all
    			present books
  			end

				desc 'Return a specific book'
				route_param :id do
  				get do
    				book = Book.find(params[:id])
    				present book
  				end
  			end
			end
    end
  end
end