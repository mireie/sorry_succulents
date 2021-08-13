require "rails_helper"

RSpec.describe User, type: :model do
  [:email, :password].each do |field|
    it { should validate_presence_of(field) }
  end
end
