module Moderator
  class ImagesController < BaseController
    before_action :find_image, only: [:show, :accept, :destroy]
    def index
      @images = Image.all
    end

    def show ; end

    def accept
      if @image.update(published: true)
        redirect_to moderator_images_path, notice: 'Image accepted'
      else
        redirect_to moderator_images_path, alert: @image.errors.full_messages.join(' ')
      end
    end

    def destroy
      @image.destroy
      redirect_to moderator_images_path, notice: 'Image removed'
    end

    private

    def find_image
      @image = Image.find(params[:id])
    end
  end
end
