class Api::V1::CurrentUserController < ApplicationController
  def index
    render json: {
      data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    }, status: :ok
  end
end
