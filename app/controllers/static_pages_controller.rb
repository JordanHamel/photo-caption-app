class StaticPagesController < ApplicationController

	def home
    @photos = Photo.select("photos.*").order("updated_at DESC").limit(5)
	end

end