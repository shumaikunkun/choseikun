class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

end
