class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  [:name, :cost, :price, :description, :country_of_origin].each do |field|
    validates field, presence: true
  end
  validates_length_of :name, maximum: 50
end