class Category < ApplicationRecord
    has_many :medicaments, dependent: :nullify
    validates :name, presence: true
    paginates_per 10
end
