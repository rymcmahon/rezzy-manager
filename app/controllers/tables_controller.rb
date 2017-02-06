class TablesController < ApplicationController
  def index
    @tables = Table.all
    if params[:search]
      @tables = Table.search(params[:search])
    end
  end
end
