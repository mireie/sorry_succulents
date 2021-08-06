require "rails_helper"

describe Review do
  it { should belong_to(:product) }
  [:author, :content_body, :rating].each do |field|
    it { should validate_presence_of(field) }
  end
  it { should validate_length_of(:content_body).is_at_most(250)}
  it { should validate_length_of(:content_body).is_at_least(50)}
  it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(1)}
  it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5)}
end
