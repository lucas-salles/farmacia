require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe ".valid?" do
    it "Compra com nulo" do
      sale = Sale.new
      expect(sale.valid?).to be_falsey
    end

    it "Compra sem nulo" do
      sale = Sale.new
      sale.date_sale = DateTime.current.to_date
      sale.user_id = 1
      sale.user = 'Teste'
      expect(sale.valid?).to be_truthy
    end
  end
end
