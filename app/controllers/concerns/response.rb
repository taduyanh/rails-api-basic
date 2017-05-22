module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def not_found_response(message = I18n.t('api_error.not_found'))
    render json: { message: message }, status: :not_found
  end

  def successfull_response(message)
    render json: message, status: :ok
  end
end