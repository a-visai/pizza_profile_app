class PizzasController < ApplicationController

  def index
    @pizza = Pizza.all
  end

  def show
    @pizza = Pizza.find(params[:id])
  end

  def new
    @pizza = Pizza.new
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.valid?
      @pizza.save
      redirect_to pizzas_path
    else
      @errors = @pizza.errors.full_messages
      render :new
    end
  end

  def edit
    @pizza = Pizza.find(params[:id])
  end

  def update
    @pizza = Pizza.find(params[:id])
    if @pizza.update(pizza_params)
      redirect_to :pizza
    else
      @errors = @pizza.errors.full_messages
      render :new
    end
  end

  def destroy
    @pizza = Pizza.destroy(params[:id])
    redirect_to :pizzas
  end

private

  def pizza_params
    params.require(:pizza).permit(:name, :style)
  end

end
