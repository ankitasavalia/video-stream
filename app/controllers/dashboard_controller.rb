class DashboardController < ApplicationController

	def index
		@organizations = Organization.all
	end
end