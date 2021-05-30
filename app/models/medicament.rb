class Medicament < ApplicationRecord
    belongs_to :category
    has_many :saleDetails
    has_many :sales, through: :saleDetails
    validates :name, :description, :price, presence: true
    paginates_per 10
end
