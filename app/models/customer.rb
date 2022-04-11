class Customer < ApplicationRecord
    has_one :user, as: :type_id, dependent: :destroy
    has_one :cart
    accepts_nested_attributes_for :user

    validates :name, :contact_no, :address, presence: true
    validates :contact_no, length: { is: 10 }
    validates :name, length: { minimum: 3 }
end
