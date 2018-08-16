class LandmarksController < ApplicationController

  get "/landmarks" do
		@landmarks = Landmark.all
		erb :"/landmarks/index"
	end


	get "/landmarks/new" do
		@figures = Figure.all

		erb :"/landmarks/new"
	end

	get "/landmarks/:id" do
		@landmark = Landmark.find(params[:id])

		erb :"/landmarks/show"
	end

	post "/landmarks" do
		@landmark = Landmark.create(params[:landmark])
		@landmark.figure = Figure.find_or_create_by(params[:figure]) if !params[:figure][:name].empty?
		@landmark.save

		redirect :"/landmarks/#{@landmark.id}"

	end

	get "/landmarks/:id/edit" do
		@landmark = Landmark.find(params[:id])
		@figure = Figure.all

		erb :"/landmarks/edit"
	end

	patch "/landmarks/:id" do
		@landmark = Landmark.find_by_id(params[:id])

		#if !landmark.blank?
			@landmark.update(params[:landmark])
			@landmark.save
		#end

		redirect "/landmarks/#{@landmark.id}"
	end

end
