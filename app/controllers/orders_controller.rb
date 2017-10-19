class OrdersController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to account_orders_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_no)
  end
end
