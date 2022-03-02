class ApplicationController < ActionController::API
    before_action :set_user, only: %i[index create]
    rescue_from ArgumentError, with: :render_unprocessable_entity_response

    def set_user
      user = User.find_by(authentication_token: request.headers['token'])
      if user.present?
        @current_user = user
      else
        head(:unauthorised)
      end
    end
  
    protected
  
    def current_user
      @current_user
    end

    private
    
    def render_unprocessable_entity_response(invalid)
        byebug
      render json: { errors: invalid.message }, status: :unprocessable_entity
    end
  end
