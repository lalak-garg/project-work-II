class Seller < ApplicationRecord
    has_one :user, as: :type_id, dependent: :destroy
    accepts_nested_attributes_for :user

    has_many :products

    validates :name, :address, :status, presence: true
    validates :name, length: { minimum: 3 }
end
