class RablController < ApplicationController
	respond_to :json

	def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end
end
