class Api::BaseController < ApplicationController
  include ActionController::Serialization
  include Response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ApiError::Base, with: :render_error_response

  private
  def render_not_found exception
    successfull_response(ApiError::Base.new(exception.class.name).to_hash)
  end

  def render_error_response exception
    successfull_response exception.to_hash
  end
end