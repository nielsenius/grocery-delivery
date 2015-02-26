class GroceryList < ActiveRecord::Base

	has_many :items
	belongs_to :user

	validates_presence_of :user_id
end
