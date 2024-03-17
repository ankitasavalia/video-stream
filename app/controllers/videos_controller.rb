class VideosController < ApplicationController
	def index
		@videos = Video.all
	end

	def new 
		@video = Video.new
	end

	def create
		video = Video.new(video_params)
		video.save!
	end

	private

	def video_params
		params.require(:video).permit(:description, :categories, :main_video, :thumbnail_image).merge(user_id: 13)
	end
end
