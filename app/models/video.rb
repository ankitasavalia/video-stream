class Video < ApplicationRecord
	has_one_attached :main_video
	has_one_attached :thumbnail_image
	has_one_attached :transcoded_video

	validates :main_video, presence: true
	validate :validate_main_video
	validate :validate_thumbnail_image


	def validate_main_video
		return if (main_video.attached? && 
													main_video.content_type.in?(%w(video/mov video/avi video/mpeg)) &&
													main_video.byte_size < 3.gigabytes
											  )

		errors.add('Video must be attached and less then 3GB in size')
	end

	def validate_thumbnail_image
		return if (thumbnail_image.attached? && 
													thumbnail_image.content_type.in?(%w('image/png', 'image/jpg', 'image/jpeg')) &&
													thumbnail_image.byte_size < 5.megabytes
											  )

		errors.add('Video must be attached and less then 3GB in size')
	end
end
