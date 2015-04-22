class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :name, :presence => true, length: { minimum: 3 }
	validates :address, :presence => true
	validates :description, :presence => true

end
