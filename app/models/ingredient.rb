class Ingredient < ApplicationRecord

  # Database relationships
  has_many :doses

  # Validation
  validates :name, presence:true, uniqueness: true
end
