class Remind < ActiveRecord::Base
	belongs_to :user

	validates_length_of :name, maximum: 30
end
