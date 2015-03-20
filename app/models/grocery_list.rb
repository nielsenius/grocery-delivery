class GroceryList < ActiveRecord::Base
  
	has_many :items, dependent: :destroy
	has_one :order
	belongs_to :user
  
  accepts_nested_attributes_for :items, reject_if: lambda { |item| item[:name].blank? }, allow_destroy: true
  
  validates_presence_of :name
	validates_presence_of :user_id
  
end
