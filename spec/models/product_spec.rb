require 'rails_helper'

#loops through the required fields and validates they are true by their presence.

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:each) do
      @product = Product.new do |p|
        p.name = "Leafy"
        p.price_cents = 30
        p.quantity = 5
        p.category = Category.new
      end
    end

    it 'is valid with all four fields' do
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end  
end

# validates :name, presence: true
# validates :price, presence: true ## needs to be price_cents
# validates :quantity, presence: true
# validates :category, presence: true