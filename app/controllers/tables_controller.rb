class TablesController < ApplicationController
  def index
    @tables = Table.all
    if params[:guests]
      @tables = Table.search(params[:guests], params[:day], params[:time])
    end
  end

  def search
    @tables = Table.where('cast(seating_capacity as text) >= ?', guests)
  end
end
