class VideoConverter

  def initialize(video_id)
    @video = Video.find(video_id)
  end

  def convert!
    process_video
  end

  private

  def process_video
    @video.main_video.open(tmpdir: "/tmp") do |file|
    	filename = ActiveStorage::Filename.new(@video.main_video.filename.to_s).base
	    movie = FFMPEG::Movie.new(file.path)
	    path = "tmp/video-#{filename}.mp4"
	    movie.transcode(path, { video_codec: 'libx264', audio_codec: 'aac' })
	    @video.transcoded_video.attach(io: File.open(path), filename: "video-#{filename}.mp4", content_type: 'video/mp4')
	  end
  end
end
  