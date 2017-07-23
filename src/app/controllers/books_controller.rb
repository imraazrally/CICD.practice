class BooksController < ApplicationController
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
