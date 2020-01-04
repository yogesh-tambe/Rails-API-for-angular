module AuthorInfo
  module V1
    class Authors < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :authors do

	      desc 'create a new author'
				params do
	  			requires :first_name, type: String
	  			requires :last_name, type: String
	  			requires :date_of_birth, type: Date
				end
				post do
	  			Author.create!({ first_name:params[:first_name], last_name:params[:last_name],date_of_birth:params[:date_of_birth]})
				end

  			desc 'Return list of authors'
  			get do
    			authors = Author.all
    			present authors
  			end

				desc 'Return a specific author'
				route_param :id do
  				get do
    				author = Author.find(params[:id])
    				present author
  				end
  			end
			end
    end
  end
end