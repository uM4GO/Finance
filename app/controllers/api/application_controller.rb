class Api::ApplicationController < ApplicationController
  include ActionController::ImplicitRender
  include ActionController::Helpers
  include ActionController::Rendering
  include ActionView::Layouts

  append_view_path Rails.root.join("app", "views")

  Rails.logger.info("TESTANDO...\n\n")

  #layout false
end
