class DosesController < ApplicationController
  before_action :set_dose, only: [ :show, :edit, :update, :destroy ]
  before_action :set_cocktail, except: [ :destroy ]

  def index
    @doses =  Dose.all
  end

  # def top
  #   @cocktails = Dose.where(stars: 5)
  #   render :index
  # end

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
      redirect_to dose_path(@dose)
    else
      render :edit
    end
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
