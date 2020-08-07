class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :getCategoryNav
	

	private
	def getCategoryNav
		@categoryNav = Category.all
	end
end
