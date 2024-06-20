class PostRelaxesController < ApplicationController

  def new
    @post_relax = PostRelax.new
  end

  def create
    @post_relax = PostRelax.new(post_relax_params)
    @post_relax.user_id = current_user.id
    if @post_relax.save
      redirect_to post_relax_path(@post_relax.id),
      notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def index
    @post_relaxes = PostRelax.page(params[:page]).reverse_order
    @user = current_user
  end

  def show
    @post_relax = PostRelax.find(params[:id])
    @post_comment = PostComment.new
    @user = @post_relax.user
  end

  def edit
    @post_relax = PostRelax.find(params[:id])
    if @post_relax.user_id != current_user.id
      redirect_to post_relaxes_path
    end
  end

  def update
    @post_relax = PostRelax.find(params[:id])
    if @post_relax.update(post_relax_params)
      redirect_to post_relax_path(@post_relax.id),
      notice: "投稿内容の更新に成功しました"
    else
      render :edit
    end
  end

  def destroy
    @post_relax = PostRelax.find(params[:id])
    @post_relax.destroy
    redirect_to post_relaxes_path
  end

  private

  def post_relax_params
    params.require(:post_relax).permit(:image, :caption)
  end
end
