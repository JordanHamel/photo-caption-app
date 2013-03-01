class StaticPagesController < ApplicationController

	def home

    #query for most recent photos
    #in css, make sure photos don't stretch
    @photos = Photo.limit(10)
	end

end