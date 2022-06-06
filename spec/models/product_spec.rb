require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do 
      @category = Category.new name: 'Pet plants'
      @product = @category.products.new({ name: 'London Plant', description: 'London Plant is an amazingly cute and soft plant that cries "meow" every time you pass by and gets upset if you do not pet and show affection to it.', quantity: 7, price: 35})
    end

    context "when adding a new product to the database" do
      it "saves an item successfully if all fields are validated" do
        expect(@product.save).to eq true
      end

      it "fails to save the new product when it is missing name" do
        @product.name = nil
        @product.save
        expect(@product.errors.full_messages).to include ("Name can't be blank")
      end

      it "fails to save the new product when it is missing quantity" do
        @product.quantity = nil
        @product.save
        expect(@product.errors.full_messages).to include ("Quantity can't be blank")
      end

      it "fails to save the new product when it is missing price" do
        @product.price = nil
        @product.price_cents = nil
        @product.save
        expect(@product.errors.full_messages).to include ("Price can't be blank")
      end

      it "fails to save the new product when it is missing category" do
        @product2 = Product.new({ name: 'London plant', quantity: 8, price: 35, category: nil })
        @product2.save
        expect(@product2.errors.full_messages).to include ("Category can't be blank")

      end

    end
  end
end
