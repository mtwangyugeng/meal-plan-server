class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :list_items, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy

  validates :name, :unit, :amount, :price, :store, :user_id, :presence => true
end
