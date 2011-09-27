class MainController < ApplicationController

	protect_from_forgery

	def index
		@seeds = Array.new

		getCategories.each do |cat|
			tempseeds = Seed.where(:category => cat, :ranking => 0..4 )
			if tempseeds.size > 0
				@seeds.push(tempseeds)
			end
		end
	end

	def seedshow

		@seed = Seed.find(params[:id])

		respond_to do |format|
			format.js { render "seeds/show" }
		end
	end
end
