class UsersController < ApplicationController

  def index
    @user = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    if !signed_in?
      @user = User.new
    else
      redirect_to(root_url)
    end
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to root_path
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