class Api::ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ActionController::Helpers
  
  Rails.logger.info("TESTANDO...\n\n")

  #layout false
end