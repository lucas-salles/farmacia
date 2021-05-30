require 'rails_helper'

RSpec.describe Medicament, type: :model do
  describe ".valid?" do
    it "Medicamento com nulo" do
      medicament = Medicament.new
      expect(medicament.valid?).to be_falsey
    end

    it "Medicamento sem nulo" do
      category = Category.new
      category.name = 'Teste'
      
      medicament = Medicament.new
      medicament.name = 'Teste'
      medicament.description = 'Teste'
      medicament.price = 2
      medicament.category = category
      expect(medicament.valid?).to be_truthy
    end
  end
end
