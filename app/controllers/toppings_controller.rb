class ToppingsController < ApplicationController

  def new
    pizza = Pizza.find(params[:pizza_id])
    @topping = pizza.toppings.new
  end

  def create
    @topping = Topping.new(topping_params)
    if @topping.save
      redirect_to pizza_path(@topping.pizza)
    else
      @errors = @topping.errors.full_messages
      render :new
    end
  end

  def edit
    @topping = Topping.find(params[:id])
  end

  def update
    @topping = Topping.find(params[:id])
    if @topping.update(topping_params)
      redirect_to pizza_path(@topping.pizza)
    else
      render :new
    end
  end

  def destroy
    @topping = Topping.destroy(params[:id])
    redirect_to pizza_path(@topping.pizza)
  end

private

  def topping_params
    params.require(:topping).permit(:pizza_id, :protein, :cheese, :sauce, :extras)
  end

end
