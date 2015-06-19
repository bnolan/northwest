module V1
  class PhotosController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]

    def index
      render :json => Purchase.find(params[:purchase_id]).photos.visible_to(current_user)
    end

    def show
      render :json => Purchase.find(params[:purchase_id]).photos.visible_to(current_user).find(params[:id])
    end

    def create
      render :json => User.purchases.find(params[:purchase_id]).photos.create!(photo_params)
    end

    private

    def photo_params
      params.require(:photos).permit(:image)
    end
  end
end
