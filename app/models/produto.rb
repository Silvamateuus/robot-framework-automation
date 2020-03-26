class Produto < ApplicationRecord
    validates :nome, presence: true
    validates :preco, presence: true
    validates :quantidade, presence: true
end
