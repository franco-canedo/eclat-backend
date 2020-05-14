class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :update, :gallery]
 
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
 
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    user = User.first
    user.photos.attach(params[:photos])
    render json: user.photos
  end 

  def gallery
    user = User.first
    render json: user.photos
  end 
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, photos: [])
  end
end
