class Api::V1::UsersController < ApplicationController
  def create
    # require 'pry'; binding.pry
    @user = User.new(user_params)
    if @user.save
      # require 'pry'; binding.pry
      render json: UserSerializer.new(@user)
    else
      # require 'pry'; binding.pry
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end