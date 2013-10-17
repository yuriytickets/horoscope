class UsersController < ApplicationController

  def index
    if signed_in?
      @user = current_user
    else
      flash[:error] = "you need to sign in"
      redirect_to(root_url)
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@user, current_user, "")
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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path
    else
      flash[:error] = "Error"
      redirect_to :back
    end
  end
end