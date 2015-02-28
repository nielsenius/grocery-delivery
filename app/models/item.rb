class Item < ActiveRecord::Base

	belongs_to :grocery_list

	validates_presence_of :grocery_list_id
	validates_presence_of :name
	validates_presence_of :amount


end
