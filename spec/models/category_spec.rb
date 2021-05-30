require 'rails_helper'

RSpec.describe Category, type: :model do
  describe ".valid?" do
    it "Categoria com nulo" do
      category = Category.new
      expect(category.valid?).to be_falsey
    end

    it "Categoria sem nulo" do
      category = Category.new
      category.name = 'Teste'
      expect(category.valid?).to be_truthy
    end
  end
end
