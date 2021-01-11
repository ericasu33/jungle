require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new(:name => "Furniture")
    @category.save!
  end

  describe 'Validation' do
    it 'should save successfuly with all four fields (name, price, quantity, category) set' do
      @product = Product.new(:name => "Shelf", :price_cents => 10000, :quantity => 5, :category => @category)

      @product.save!
    end

    it 'should validate that name input is requried' do
      @product = Product.new
      @product.price = 10000
      @product.quantity = 3
      @product.category = @category

      @product.save
      expect(@product.errors.full_messages).to be_present
    end

    it 'should validate that price input is requried' do
      @product = Product.new
      @product.name = "Shelf"
      @product.quantity = 3
      @product.category = @category

      @product.save
      expect(@product.errors.full_messages).to be_present
    end

    it 'should validate that quantity input is requried' do
      @product = Product.new
      @product.name = "Shelf"
      @product.price = 10000
      @product.category = @category

      @product.save
      expect(@product.errors.full_messages).to be_present
    end

    it 'should validate that quantity input is requried' do
      @product = Product.new
      @product.name = "Shelf"
      @product.price = 10000
      @product.quantity = 5

      @product.save
      expect(@product.errors.full_messages).to be_present
    end
  end

end
