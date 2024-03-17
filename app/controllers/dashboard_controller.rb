class DashboardController < ApplicationController

	def index
		@organizations = Organization.all
		@videos = Video.all
	end
end