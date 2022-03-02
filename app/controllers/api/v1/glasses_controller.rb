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
          render json: { price: currency_converter(current_user.currency, total_price) }
        end
      end

      private

      def glass_params
        params.permit(:frame_id, :lense_id)
      end
      
      def currency_converter(type, sum)
        case type
        when 'USD'
          "#{(sum * 0.013).round(3)} Doller"
        when 'EUR'
          "#{(sum * 0.012).round(3)}  Euro"
        when 'GBP'
          "#{(sum * 0.0099).round(3)}  Pound"
        when 'JOD'
          "#{(sum * 0.0094).round(3)}  Jordanian Dinar"
        when 'JPY'
          "#{(sum * 1.52).round(3)}  Japanese Yen"
        else
          "#{sum} Rupees"
        end
      end
    end
  end
end
