class GroceryListsController < ApplicationController
  before_action :set_grocery_list, only: [:show, :edit, :update, :destroy]

  # GET /grocery_lists
  def index
    # @grocery_lists = GroceryList.all
    @grocery_lists = GroceryList.for_user(current_user.id).all
  end

  # GET /grocery_lists/1
  def show
    @items = @grocery_list.items.all
  end

  # GET /grocery_lists/new
  def new
    @grocery_list = GroceryList.new
    @gro_id = @grocery_list_id
    @grocery_list.items.build
    @item = Item.new
  end

  # GET /grocery_lists/1/edit
  def edit
  end

  # POST /grocery_lists
  def create
    @grocery_list = GroceryList.new(grocery_list_params)
    
    if @grocery_list.save
      redirect_to @grocery_list, notice: "Grocery list added!"
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /grocery_lists/1
  def update
    if @grocery_list.update(grocery_list_params)
      redirect_to @grocery_list
    else
      render action: 'edit'
    end
  end

  # DELETE /grocery_lists/1
  def destroy
    @grocery_list.destroy
    redirect_to grocery_lists_url
  end

  private
    # Setup callback
    def set_grocery_list
      @grocery_list = GroceryList.find(params[:id])
    end

    # White list parameters
    def grocery_list_params
      params.require(:grocery_list).permit(:name, :user_id, items_attributes: [:name, :amount, :grocery_list_id])
    end
end
