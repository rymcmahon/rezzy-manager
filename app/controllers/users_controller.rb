class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_reservation = @user.reservations.find_by(:user_id => @user.id)
  end

  def new
    @user = User.new
    @user.reservations.build
    @user.tables.build
    @reserved_tables = Table.reserved_on(params[:guests], params[:day], params[:time])
    @open_tables = Table.free_on(params[:guests], params[:day], params[:time])
    @booked_table = Table.free_on(params[:guests], params[:day], params[:time])
    @guests = params[:guests]
    @day = params[:day]
    @time = params[:time]
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.reservation_email(@user).deliver_now
      redirect_to @user
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
    redirect_to '/reservations', alert: 'User Deleted!'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone,
    reservations_attributes: [:id, :date, :starts_at, :ends_at, :table_id, :diners, :destroy],
    tables_attributes: [:id, :seating_capacity, :destroy])
  end

end
