class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
    @group=Group.new

  end

  def mypage
  end

  def record
  end

  def group_area
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @group = @post.group
  end

  def create
    @post=Post.new(content:params[:content],user_id: @current_user.id, group_id: @current_group.id)
    if @post.save
       redirect_to("/posts/index")
    else
       render("posts/new")
    end
  end

  def edit
    @post=Post.find_by(id:params[:id])
  end

  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    if @post.save
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
       flash[:notice] = "権限がありません"
       redirect_to("/posts/index")

    end
  end
end
