module Api
    module V1
        class FramesController < ApplicationController

            def index
                if current_user.admin?
                    frames = Frame.order(:id)
                else
                    byebug
                    frames = Frame.active
                end
                render json: {frames: frames }, status: 200
            end

            def create
                if current_user.role == "admin"
                    frame = Frame.new(frame_params)
                    if frame.save
                        render json: {frame: frame}, status: :created
                    end
                else
                    render json: {message: "user is not allowd to create"}, status: 401
                end
            end

            private
            def frame_params
                params.permit(:name, :description, :status, :stock, :price)
            end
        end
    end
end