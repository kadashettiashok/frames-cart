require "services/convert_currency_service"
module Api
  module V1
    class GlassesController < ApplicationController
      def index
        frames = Frame.all
        render json: { data: frames }, status: 200
      end

      def create
        frame = Frame.find_by(id: glass_params[:frame_id])
        lense = Lense.find_by(id: glass_params[:lense_id])

        if frame.stock <= 0 || lense.stock <= 0
          if frame.stock <= 0
            message = "frames out of stock"
          elsif lense.stock <= 0
            message = "Lenses out of stock"
          end
          render json: { message: message }
        else
          total_price = frame.price + lense.price
          Frame.find_by(id: frame.id).update(stock: (frame.stock - 1))
          Lense.find_by(id: lense.id).update(stock: (lense.stock - 1))
          render json: { price: Services::CovertCurrencyService.new(current_user.currency, total_price).call }
        end
      end

      private

      def glass_params
        params.permit(:frame_id, :lense_id)
      end
    end
  end
end
