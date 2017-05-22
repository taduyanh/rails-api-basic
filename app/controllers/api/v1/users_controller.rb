module Api::V1
  class UsersController < Api::BaseController
    def index
      json_response User.all
    end

    def show
      #raise ApiError::Unauthenticated
      json_response User.find(params[:id])
    end
  end
end
