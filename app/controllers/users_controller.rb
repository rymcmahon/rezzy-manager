class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.reservations.build
    @user.tables.build
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.reservations.update(ends_at: @user.reservations.last.starts_at.advance(hours: 1))
      redirect_to '/'
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/', alert: 'User Deleted!'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone,
    reservations_attributes: [:id, :date, :starts_at, :ends_at, :table_id, :destroy],
    tables_attributes: [:id, :seating_capacity, :destroy])
  end

end
