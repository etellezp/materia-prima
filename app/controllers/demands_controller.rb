class DemandsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @demands = Demand.all
    if params[:demand_name]
      @demands = Demand.search_demand(params[:demand_name]).order("created_at DESC").page(params[:page]).per_page(10)
    else
      @demands = Demand.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @demand = Demand.find(params[:id])
  end

  def new
    @demand = current_user.demands.build
  end

  def create
    @demand = current_user.demands.build(demand_params)
    if @demand.save
      redirect_to demand_path(@demand)
    else
      render :new
    end
  end

  def edit
    @demand = Demand.find(params[:id])
    unless current_user.id == @demand.user_id
      flash[:notice] = "You don't have access to edit that demand"
      redirect_to demand_path(@demand)
    end
  end

  def update
    @demand = Demand.find(params[:id])
    if @demand.update(demand_params)
      redirect_to demand_path(@demand)
    else
      render :edit
    end
  end

  def destroy
    @demand = current_user.demands.find(params[:id])
    @demand.destory
    redirect_to demands_path
  end

  private

  def demand_params
    params.require(:demand).permit(:name, :quantity, :location)
  end
end
