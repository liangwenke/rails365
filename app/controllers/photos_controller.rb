class PhotosController < ApplicationController
  def create
    @photo = Photo.new
    @photo.image = params[:image]
    @photo.save
    render text: @photo.image_url(:preview).to_s
  end
end
