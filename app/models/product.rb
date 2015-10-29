class Product < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	validates :price, numericality: { greater_than: 0, allow_nil: true }
	validates :name, :description, presence: true

	def self.latest
		Product.order(:updated_at).last
	end
end
