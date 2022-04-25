class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe_id, :ingredient_id, :amount, :presence => true
end
