class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :update, :gallery, :updateAbout, :updateContact]
 
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

  def updateAbout
    user = User.first
    user.motto = params[:motto]
    user.who_we_are = params[:who_we_are]
    user.save
    render json: user  
  end 

  def updateContact
    user = User.first
    user.company_name = params[:company_name]
    user.company_address = params[:company_address]
    user.email = params[:email]
    user.phone_number = params[:phone_number]
    user.save
    render json: user  
  end 
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, :motto, :who_we_are, 
    :company_name, :company_address, :email, :phone_number, photos: [])
  end
end
