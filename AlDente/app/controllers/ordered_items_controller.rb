class OrderedItemsController < ApplicationController
  before_action :set_ordered_item, only: [:show, :edit, :update, :destroy]

  # GET /ordered_items
  # GET /ordered_items.json
  def index
    @ordered_items = OrderedItem.all
  end

  # GET /ordered_items/1
  # GET /ordered_items/1.json
  def show
    @ordered_item = OrderedItem.find(params[:id])
    # @item = @ordered_item.where(@item.ordered_item, @ordered_item)
    # @item = Item.where(id => @ordered_item.item_id)
    @item = Item.find(@ordered_item.item_id)
  end

  # GET /ordered_items/new
  def new
    @ordered_item = OrderedItem.new
  end

  # GET /ordered_items/1/edit
  def edit
  end

  # POST /ordered_items
  # POST /ordered_items.json
  def create
    @ordered_item = OrderedItem.new(ordered_item_params)

    respond_to do |format|
      if @ordered_item.save
        format.html { redirect_to @ordered_item, notice: 'Ordered item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ordered_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @ordered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordered_items/1
  # PATCH/PUT /ordered_items/1.json
  def update
    respond_to do |format|
      if @ordered_item.update(ordered_item_params)
        format.html { redirect_to @ordered_item, notice: 'Ordered item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ordered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordered_items/1
  # DELETE /ordered_items/1.json
  def destroy
    @ordered_item.destroy
    respond_to do |format|
      format.html { redirect_to ordered_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_item
      @ordered_item = OrderedItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordered_item_params
      params.require(:ordered_item).permit(:item_id, :order_id)
    end
end
