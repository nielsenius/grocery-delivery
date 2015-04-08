class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    puts order_params
    @order = Order.new(order_params)
    
    if @order.save
      redirect_to @order
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:tip, :notes, :store, :delivery_time, :shopper_id, :grocery_list_id).merge(buyer_id: current_user.id)
    end
end
