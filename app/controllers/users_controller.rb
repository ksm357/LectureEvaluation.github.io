class UsersController < ApplicationController
  def index
    @favorite_courses = []
    Favorite.where('user_id =?', current_user.id).each do |f|
      @favorite_courses << Course.find(f.course_id)
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/"
    else
      redirect_to :back
    end
  end

  def favorites_add
    if @current_user.favorites_addition(params[:u_id].to_i, params[:c_id].to_i)
      redirect_to :back
    end
  end

  def favorites_delete
    if @current_user.favorites_addition(params[:u_id].to_i, params[:c_id].to_i)
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
