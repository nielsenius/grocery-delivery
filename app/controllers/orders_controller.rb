class OrdersController < ApplicationController
  before_action :set_order, only: [:complete, :accept_order, :show, :edit, :update, :destroy]
  
  # GET /complete/1
  def complete
    @order.complete = true
    @order.save
    redirect_to @order
  end
  
  # GET /shopping
  def shopping
    u_id = current_user.id
    @orders = Order.where("shopper_id = ? AND complete = ?", u_id, false).all
  end
  
  # GET /accept_order/1
  def accept_order
    @order.shopper_id = current_user.id
    @order.save
    redirect_to @order
  end
  
  # GET /my_orders
  def my_orders
    u_id = current_user.id
    @completed = Order.where("buyer_id = ? AND complete = ?", u_id, true).all
    @incomplete = Order.where("buyer_id = ? AND complete = ?", u_id, false).all
  end
  
  # GET /orders
  def index
    u_id = current_user.id
    @orders = Order.where("shopper_id IS NULL AND complete = ? AND buyer_id <> ?", false, u_id).all
  end

  # GET /orders/1
  def show
    @items = Item.where(grocery_list_id: @order.grocery_list_id).all
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
