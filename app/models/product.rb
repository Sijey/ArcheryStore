class Product < ActiveRecord::Base
	validates :price, numericality: { greater_than: 0, allow_nil: true }
	validates :name, :description, presence: true
end
