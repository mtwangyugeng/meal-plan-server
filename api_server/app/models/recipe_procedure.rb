class RecipeProcedure < ApplicationRecord
  belongs_to :recipe

  validates :recipe_id, :content, :presence => true
end
