class TablesController < ApplicationController
  def index
    @tables = Table.all
    # @reserved_tables = Table.reserved_on(params[:day], params[:time])
    # @open_tables = Table.free_on(params[:day], params[:time])
    @reserved_tables = Table.reserved_on(params[:day])
    @open_tables = Table.free_on(params[:day])
  end
end
