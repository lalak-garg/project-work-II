class Product < ApplicationRecord
  belongs_to :category
  belongs_to :seller
  
  validates :name, :category_id, :price, presence: true
end
