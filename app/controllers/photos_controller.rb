class PhotosController < ApplicationController
  def create
    @photo = Photo.new
    @photo.image = params[:image]
    @photo.save
    render text: @photo.image.url
  end
end
