class DosesController < ApplicationController
  before_action :set_doses, only: %i[show destroy]
  before_action :set_cocktail, only: %i[index new create]

  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @dose.ingredient = Ingredient.find(params[:ingredient_id])
    # ingredient = Ingredient.find(params[:ingredient_id])
    # raise
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private

  def set_doses
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
