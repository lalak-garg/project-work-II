class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :seller
  has_many :items
end
