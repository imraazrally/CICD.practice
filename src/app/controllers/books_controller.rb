class BooksController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def index
		render :json => Book.all
	end

	def create
		title = params[:title]
		b=Book.create(:title=>title)
		b.save!
		render :json => b
	end
end
