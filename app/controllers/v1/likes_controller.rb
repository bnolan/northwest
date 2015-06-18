module V1
  class LikesController < ApplicationController
    def create
      Purchase.find(params[:purchase_id]).likes.create! :user => current_user
      render json: {success: true}
    end

    def destroy
      Purchase.find(params[:purchase_id]).likes.where(:user => current_user).destroy_all
      render json: {success: true}
    end
  end
end
