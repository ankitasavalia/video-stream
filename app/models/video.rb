class Video < ApplicationRecord
	has_one_attached :main_video
	has_one_attached :thumbnail_image
end
