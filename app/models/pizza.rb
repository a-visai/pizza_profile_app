class Pizza < ApplicationRecord
  has_many :toppings
  validates :name, :style, presence: true
  validates :name, uniqueness: true
end
