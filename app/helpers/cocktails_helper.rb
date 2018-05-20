module CocktailsHelper
  def cocktails_helper(cocktail)
    cocktail.photo.present? ? cocktail.photo : ""
  end
end
