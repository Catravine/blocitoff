class ItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash.now[:alert] = "There was an error saving the item.  Please try again."
    end

    redirect_to :back

  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" -is- DONE!"
    else
      flash.now[:alert] = "There was an error marking off this item."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
