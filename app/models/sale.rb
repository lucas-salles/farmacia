class Sale < ApplicationRecord
    has_many :saleDetails
    has_many :medicaments, through: :saleDetails
    validates :date_sale, :user_id, :user, presence: true
    paginates_per 10
end
