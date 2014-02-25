class TablesController < ApplicationController

  # Check that only Admins have access to this controller (probably not right/not integrated with ActiveAdmin)
  # Based off Marcus' final cook-book app
  # before_filter :user_is_admin

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def create
    new_table = params.permit(:table).require(:capacity, :restaurant_id)
    table = Table.create(new_table)
    # Where to redirect?
    #redirect_to admin_tables_path
  end

  def show
    @table = Table.find(params[:id])
  end

  def edit
    table = Table.find(params[:id])
    fixed_table = params.permit(:table).require(:capacity)
    table.update_attributes(fixed_table)
    # Where to redirect?
    #redirect_to admin_tables_path
  end

  def delete

  end

end
