class CocktailsController < ApplicationController

  def index
    select_cocktails
  end

  def show
    select_cocktail
    @doses = Dose.where(cocktail: @cocktail)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create!(create_cocktail_hash)

    create_doses_array.each do |d|
      Dose.create!(d)
    end

  end

  private
  def create_cocktail_hash
    hash = {
      name: params["cocktail"]["name"]
    }
  end


  def create_doses_array
    array = []
    i = 0
    params["cocktail"]["doses"].each do |desc|
      array << {
        description:  desc["description"],
        cocktail:     @cocktail,
        ingredient:   Ingredient.find_by(name: params["cocktail"]["ingredients"][i]["name"])
      }
      i += 1
    end
    return array
  end

  def select_cocktails
    @cocktails = Cocktail.all
  end

  def select_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
