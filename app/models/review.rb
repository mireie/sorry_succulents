class Review < ApplicationRecord
  belongs_to :product
  [:author, :content_body, :rating].each do |field|
    validates field, presence: true
  end
  validates :rating, :numericality => {:only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5}
  validates :content_body, length: {in: 50..250}
end