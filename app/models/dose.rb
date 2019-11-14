class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true, allow_blank: false
  validates :ingredient, presence: true
  validates :cocktail, presence: true
  validates_uniqueness_of :ingredient, scope: :cocktail
end
