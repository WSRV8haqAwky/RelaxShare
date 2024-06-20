class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).reverse_order
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @post_relaxes = PostRelax.page(params[:page]).where(user_id: @user.id).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),
      notice: "プロフィールの更新に成功しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
