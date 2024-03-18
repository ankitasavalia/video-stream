class VideoConvertJob < ApplicationJob
  queue_as :default

  def perform(video_id)
    VideoConverter.new(video_id).convert!
  end
end
