class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  [:name, :cost, :price, :description, :country_of_origin].each do |field|
    validates field, presence: true
  end
  validates_length_of :name, maximum: 100
  before_save(:titleize_product)
  scope :country, ->(country) { where(country_of_origin: country) }
  scope :most_reviewed, -> {
          (select("products.id, products.name, count(reviews.id) as reviews_count")
            .joins(:reviews)
            .group("products.id")
            .order("reviews_count")
            .reverse_order
            .limit(1))
        }
        def avg_rating
          if self.reviews.size > 0
          return (self.reviews.sum(:rating).to_f / self.reviews.size.to_f).to_f.round
          else 
            return -1
          end
        end
  scope :threecent, -> { order(created_at: :desc).limit(3)}
  private

  def titleize_product
    self.name = self.name.titleize
  end

end
