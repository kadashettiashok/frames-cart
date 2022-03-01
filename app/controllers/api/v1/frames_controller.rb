module Api
    module V1
        class FramesController < ApplicationController

            def index
                frames = Frame.all
                render json: {frame: frames }, status: 200
            end

            def create
                frame = Frame.new(frame_params)
                if frame.save
                    render json: {frame: frame }, status: :created
                end
            end

            private
            def frame_params
                params.permit(:name, :description, :status, :stock, :price)
            end
        end
    end
end