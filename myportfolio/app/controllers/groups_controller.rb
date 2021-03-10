class GroupsController < ApplicationController
  before_action :authenticate_group, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_group, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_group, {only: [:edit, :update]}

  def index
    @groups = Group.all
  end

  def show
      @group = Group.find_by(id: params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(name:params[:name],image_name: "strong-31.png", code: params[:code])

    if @group.save
      session[:group_id] = @group.id
      flash[:notice] = "新しいグループを作成しました"
      redirect_to("/posts/index")
    else
      render("/groups/new")
    end
  end

  def change_group
    @groups = Group.all
  end

  def join_group
    @groups = Group.all
  end

  def edit
    @group = Group.find_by(id: params[:id])
  end

  def update
    @group = Group.find_by(id: params[:id])
    @group.name = params[:name]

    if params[:image]
      @group.image_name = "#{@group.id}.png"
      image = params[:image]
      File.binwrite("public/group_images/#{@group.image_name}", image.read)
    end

    if @group.save
      flash[:notice] = "グループ情報を編集しました"
      redirect_to("/groups/#{@group.id}")
    else
      render("groups/edit")
    end
  end

  def login_form
  end

  def login
    @group = Group.find_by(name: params[:name], code: params[:code])
    if @group
      session[:group_id] = @group.id
      flash[:notice] = "グループに参加しました"
      redirect_to("/posts/index")
    else
      render("groups/login_form")
    end
  end

  def logout
    session[:group_id] = nil
    flash[:notice] = "グループを退出しました"
    redirect_to("/posts/index")
  end

  def ensure_correct_group
    if @current_group.id != params[:id].to_i
       flash[:notice] = "権限がありません"
       redirect_to("/posts/index")
    end
  end

end
