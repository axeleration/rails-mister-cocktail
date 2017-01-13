class Cocktail < ApplicationRecord

  # To reflect the .schema of the database
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  # Needs a unique name
  validates :name, uniqueness: true, presence: true, format: { maximum: 40 }

end
