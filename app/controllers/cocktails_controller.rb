class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    # initialize a new instance of Cocktail with the params from my form
    @cocktail = Cocktail.new(cocktail_params)
    # save the new cocktail to the DB
      if @cocktail.save
      # redirect to the show view of the newly created cocktail
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktail_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient)
  end
end
