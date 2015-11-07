class Product < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	validates :price, numericality: { greater_than: 0, allow_nil: true }
	validates :name, :description, presence: true

	has_many :lina_items
	has_many :orders, through: :lina_items

	before_destroy :ensure_not_referenced_by_any_lina_item

	def self.latest
		Product.order(:updated_at).last
	end

	private

	def ensure_not_referenced_by_any_lina_item
		if lina_items.empty?
			return true
		else
			errors.add(:base, 'существуют товарные позиции')
			return false
		end
	end
end
