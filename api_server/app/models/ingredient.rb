class Ingredient < ApplicationRecord
  belongs_to :user

  validates :name, :unit, :amount, :price, :store, :user_id, :presence => true
end
