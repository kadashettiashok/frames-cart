module Api
    module V1
        class GlassesController < ApplicationController
            def index
                frames = Frame.all
                render json: {data: frames}, status: 200
            end

            def create
                currency_type = current_user.currency
                count = 0, frame = {},lense = {},message = ''
                glass_params.each do |k, v|
                    if k == "frame_id"
                        frame = Frame.find_by(id: v)
                        if frame.stock > 0
                            Frame.find_by(id: v).update(stock: (frame.stock - 1))
                        else
                            message = "frame is out of stock"
                        end
                    elsif k == "lense_id"
                        lense = Lense.find_by(id: v)
                        if lense.stock > 0
                            Lense.find_by(id: v).update(stock: (lense.stock - 1))
                        else
                            message = "lense is out of stock"
                        end
                    else
                        currency_type = v
                    end
                end
                sum = (frame.price + lense.price)
                sum = 0 unless message.size < 1
                total_cost = currency_converter(currency_type,sum)
                render json: {total_price: total_cost, message: message}
            end


            private

            def currency_converter(type,sum)
                case type
                    when 'USD'
                        total_cost = "#{(sum * 0.013).round(3)} Doller"
                    when 'EUR'
                        total_cost = "#{(sum * 0.012).round(3)}  Euro"
                    when 'GBP'
                        total_cost = "#{(sum * 0.0099).round(3)}  Pound"
                    when 'JOD'
                        total_cost = "#{(sum * 0.0094).round(3)}  Jordanian Dinar"
                    when 'JPY'
                        total_cost = "#{(sum * 1.52).round(3)}  Japanese Yen"
                    else
                    total_cost = "#{sum} Rupees"
                    end
            end

            def glass_params
                params.permit(:frame_id, :lense_id)
            end
        end
    end
end