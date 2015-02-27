class Order < ActiveRecord::Base

	belongs_to :user
	belongs_to :grocery_list

	validates_presence_of :buyer_id
	validates_presence_of :shopper_id
	validates_presence_of :grocery_list_id

	validates_numericality_of :tip, only_integer: true, greater_than: 0

	validates_date :placed_on
end
