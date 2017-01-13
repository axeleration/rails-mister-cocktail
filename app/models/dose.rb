class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  # Validates uniqueness of pairs of cocktail_id and ingredient_id.
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end
