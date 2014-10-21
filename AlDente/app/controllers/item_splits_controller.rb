class ItemSplitsController < ApplicationController
  before_action :set_item_split, only: [:show, :edit, :update, :destroy]

  # GET /item_splits
  # GET /item_splits.json
  def index
    @item_splits = ItemSplit.all
  end

  # GET /item_splits/1
  # GET /item_splits/1.json
  def show
  end

  # GET /item_splits/new
  def new
    @item_split = ItemSplit.new
  end

  # GET /item_splits/1/edit
  def edit
  end

  # POST /item_splits
  # POST /item_splits.json
  def create
    @item_split = ItemSplit.new(item_split_params)

    respond_to do |format|
      if @item_split.save
        format.html { redirect_to @item_split, notice: 'Item split was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_split }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_split.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_splits/1
  # PATCH/PUT /item_splits/1.json
  def update
    respond_to do |format|
      if @item_split.update(item_split_params)
        format.html { redirect_to @item_split, notice: 'Item split was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_split.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_splits/1
  # DELETE /item_splits/1.json
  def destroy
    @item_split.destroy
    respond_to do |format|
      format.html { redirect_to item_splits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_split
      @item_split = ItemSplit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_split_params
      params.require(:item_split).permit(:ordered_items_id, :customer_id, :percentage, :details)
    end
end
