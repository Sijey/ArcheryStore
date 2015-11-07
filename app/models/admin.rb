class Admin < ActiveRecord::Base
	after_destroy :ensure_an_admin_remains
	validates :name, presence: true, uniqueness: true
  has_secure_password

  private
  	def ensure_an_admin_remains
  		if Admin.count.zero?
  			raise "Последний администратор не может быть удален"
  		end
  	end
end
