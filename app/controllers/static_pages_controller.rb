class StaticPagesController < ApplicationController

	def home
    @photos = Photo.limit(5)
	end

end