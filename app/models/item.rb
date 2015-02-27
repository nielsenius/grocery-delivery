class Item < ActiveRecord::Base

	belongs_to :grocery_list

	validates_presence_of :grocery_list_id

end
