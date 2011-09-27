class SeedsController < ApplicationController
  protect_from_forgery
  
  before_filter :authed, :except => [:clicked]
  
  def new
  	@seed = Seed.new
  	
  	if request.post?
  		@seed = Seed.new(params[:seed])

		tempfile = params[:seed][:thumbnail]
		file = File.join("public", params[:seed][:thumbnail].original_filename)
	  	FileUtils.cp tempfile.path, file

		@seed.thumbnail = params[:seed][:thumbnail].original_filename

		if params[:seed][:ranking].to_i > 0
			exists = Seed.where(:category => params[:seed][:category], :ranking => params[:seed][:ranking]).first

			if !exists.nil?
				exists.ranking = -1
				exists.save
			end
		end

  		if @seed.save
  			flash[:message] = "Seed successfully created"
  			redirect_to :controller => :admins, :action => :controlpanel
  		end
  	end
  end
  
  def delete
  	@seed = Seed.find(params[:id])
	@seed.display = false
	
	if @seed.save
		flash[:message] = "Seed removed"
		redirect_to :controller => :admins, :action => :controlpanel
	end
  end
end

