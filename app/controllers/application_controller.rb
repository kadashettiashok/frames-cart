class ApplicationController < ActionController::API
    before_action :set_user, only: %i[index create]
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
  end
