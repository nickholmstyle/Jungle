require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:each) do
      @product = Product.new do |p|
        p.name = "Leafy"
        p.price = 30
        p.quantity = 5
        p.category = Category.new
      end
    end

    it 'is valid with all four fields' do
      expect(@product).to be_valid
    end
  end  
end

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true