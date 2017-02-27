class TablesController < ApplicationController
  def index
    @tables = Table.all
    @reserved_tables = Table.reserved_on(params[:guests], params[:day], params[:time])
    @open_tables = Table.free_on(params[:guests], params[:day], params[:time])

    @guests = params[:guests]
    @day = params[:day]
    @time = params[:time]
  end
end
