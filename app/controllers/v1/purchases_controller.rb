module V1
  class PurchasesController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]

    def index
      render :json => Purchase.feed(params[:latitude], params[:longitude])
    end

    def show
      render :json => Purchase.find(params[:id]).to_json(:detailed => true)
    end

    def create
      render :json => current_user.purchases.create!(purchase_params)
    end

    private

    def purchase_params
      params.require(:purchase).permit(:name, :comment, :venue_name, :venue_id, :venue_address, :latitude, :longitude)
    end
  end
end
