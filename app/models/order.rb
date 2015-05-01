class Order < ActiveRecord::Base

	belongs_to :buyer, class_name: 'User'
	belongs_to :shopper, class_name: 'User'
	belongs_to :grocery_list
  
	validates_presence_of :grocery_list_id
  
	validates_numericality_of :tip, only_integer: true, greater_than: 0
  
  def num_items
    Item.where(grocery_list_id: grocery_list_id).count
  end
  
  def self.times
    now = DateTime.now
    
    times = [
      ['30 minutes', now + 30.minutes],
      ['1 hour', now + 1.hours],
      ['2 hours', now + 2.hours],
      ['4 hours', now + 4.hours],
      ['8 hours', now + 8.hours],
      ['1 day', now + 1.days]
    ]
    
    times
  end
  
end
