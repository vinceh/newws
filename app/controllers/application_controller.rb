class ApplicationController < ActionController::Base
  protect_from_forgery

	def authed
		return true if !session[:admin].nil?
		redirect_to :controller => :main
		return false
	end

	def getCategories
		return ["News", "Tech", "Virality", "Entertainment", "Music"]
	end
end
