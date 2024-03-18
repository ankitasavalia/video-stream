class VideosController < ApplicationController
	def index
		@videos = Video.all
	end

	def new 
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)
		if @video.save!
			# respond_to do |format|
				VideoConvertJob.perform_later(@video.id)
				redirect_to(root_path)
      	# format.html { redirect_to(root_path) }
      	# format.js
			# end
      
    else
    	redirect_to new_video_path, notice: 'Something went wrong'
    	# @errors = @video.errors
    	# respond_to do |format|
        # format.js
      # end
		end
		# active_storage_disk_service = ActiveStorage::Service::DiskService.new(root: Rails.root.to_s + '/storage/')
		# movie = FFMPEG::Movie.new(active_storage_disk_service.send(:path_for, video.main_video.blob.key))
		# path = "tmp/video-#{SecureRandom.alphanumeric(12)}.mp4"
		# movie.transcode(path, { video_codec: 'libx264', audio_codec: 'aac' })
    # video.transcoded_video.attach(io: File.open(path), filename: "video-#{SecureRandom.alphanumeric(12)}.mp4", content_type: 'video/mp4')

	end

	def update
	  respond_to do |format|
	    if @video.update(user_params)
	    	VideoConvertJob.perform_later(@video.id)
	    # snip response boilerplate
	    end
	  end
	end

	private

	def video_params
		params.require(:video).permit(:description, :categories, :main_video, :thumbnail_image).merge(user_id: 13)
	end
end
