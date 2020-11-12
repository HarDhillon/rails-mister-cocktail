class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create ]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)

    @dose.ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params

    params.require(:dose).permit(:description)
  end
end
