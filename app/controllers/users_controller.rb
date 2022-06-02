class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!

  def index
    @users = policy_scope(User)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      Rails.logger.info 'Created user ##{@order.email}'
      UserMailer.with(user: @user).welcome_email.deliver_later

      redirect_to @user, notice: 'Користувач быв успішно створений.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Користувач був успішно оновлений.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Користувач був успішно видалений.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    list_params_allowed = [:name]
    list_params_allowed << :email if @user.new_record?
    list_params_allowed << :role if current_user.is_admin?
    params.fetch(:user, {}).permit(list_params_allowed)
  end

  def authorize_user!
    authorize(@user || User)
  end
end
