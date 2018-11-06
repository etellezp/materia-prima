class SuppliesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @supplies = Supply.all
    if params[:supply_name]
      @supplies = Supply.search_supply(params[:supply_name]).order("created_at DESC").page(params[:page]).per_page(10)
    else
      @supplies = Supply.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @supply = Supply.find(params[:id])
  end

  def new
    @supply = current_user.supplies.build
  end

  def create
    @supply = current_user.supplies.build(supply_params)
    if @supply.save
      redirect_to supply_path(@supply)
    else
      render :new
    end
  end

  def edit
    # @supply = current_user.supplies.find(params[:id])
    @supply = Supply.find(params[:id])
    unless current_user.id == @supply.user_id
      flash[:notice] = "No tienes acceso de editar este producto"
      redirect_to supply_path(@supply)
    end
  end

  def update
    @supply = Supply.find(params[:id])
    if @supply.update(supply_params)
      redirect_to supply_path(@supply)
    else
      render :edit
    end
  end

  def destroy
    @supply = current_user.supplies.find(params[:id])
    @supply.destroy
    redirect_to supplies_path
  end

  private

  def supply_params
    params.require(:supply).permit(:name, :quantity, :price, :location, :company)
  end

end
