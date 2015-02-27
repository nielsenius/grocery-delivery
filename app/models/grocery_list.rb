class GroceryList < ActiveRecord::Base

	has_many :items
	has_one :order
	belongs_to :user

	validates_presence_of :user_id
end
