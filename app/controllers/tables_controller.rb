class TablesController < ApplicationController
  def index
    @tables = Table.all
    if params[:guests]
      @tables = Table.search(params[:guests])
    end
  end
end
