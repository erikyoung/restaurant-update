class OrdersController < ApplicationController


 def new
 	@item = FoodItem.find(params[:food_item_id])
 	@order = Order.new(food_item: @item)
 end

 def create
 	@item = FoodItem.find(params[:food_item_id])
 	@order = @item.orders.build order_params
 	

 	if @order.save
 		flash[:success] = "Thank you for your order"
 		render '_order_end'
 		
 	else
 		render 'new'
 end
end

 def order_params
 	params.require(:order).permit(:quantity, :name, :address, :phone, :price)
 end
 
 def update
	if @order.save
		flash[:success] = "Thank you for your order."
		redirect_to menu_path, flash: {success: "Thank you for your order."}
	else
		render 'new'
 	end	
 end
end
