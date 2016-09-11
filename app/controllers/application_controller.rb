class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController

  def api_documentation; end
end
