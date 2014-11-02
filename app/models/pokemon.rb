class Pokemon < ActiveRecord::Base
	belongs_to :trainer
	validate :name ,uniqueness: true

end
