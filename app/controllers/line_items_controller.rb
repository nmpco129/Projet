class LineItemsController < ApplicationController
    .
    .
    .
    # POST /line_items
    # POST /line_items.json
    def create
        @cart = current_cart
        product = Product.find(params[:product_id])
        @line_item = @cart.add_product(product.id)

        respond_to do |format|
            if @line_item.save
                format.html { redirect_to('/', :notice => 'Line item was successfully created') }
                format.js
                format.json { render :show, status: :created, location: @line_item }
            else
                format.html { render :new }
                format.json { render json: @line_item.errors, status: :unprocessable_entity }
            end
        end
    end
    .
    .
    .
end
