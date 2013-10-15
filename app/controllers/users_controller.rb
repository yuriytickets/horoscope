class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    if !signed_in?
      @user = User.new
    else
      redirect_to(root_url)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Horoscope App!"
      redirect_to @user
    else
      render 'new'
    end
  end

end