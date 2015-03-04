namespace :db do
  # rake db:populate
  
  desc "Erase and fill database"
    
  task :populate => :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
    
    require 'faker'
    require 'factory_girl_rails'
    
    # Users
    
    matt = User.new
    matt.first_name = 'Matt'
    matt.last_name = 'Nielsen'
    matt.phone_number = '1234567890'
    matt.password_digest = 'secret'
    matt.location = 'Mudge'
    matt.save!
    
    maggie = User.new
    maggie.first_name = 'Maggie'
    maggie.last_name = 'Li'
    maggie.phone_number = '2345678901'
    maggie.password_digest = 'secret'
    maggie.location = 'West-Wing'
    maggie.save!
    
    # Grocery Lists
    
    list1 = GroceryList.new
    list1.name = 'List 1'
    list1.user_id = 1
    list1.save!
    
    list2 = GroceryList.new
    list2.name = 'List 2'
    list2.user_id = 2
    list2.save!
    
    # Items
    
    eggs = Item.new
    eggs.name = 'Eggs'
    eggs.amount = '1 dozen'
    eggs.grocery_list_id = 1
    eggs.save!
    
    milk = Item.new
    milk.name = 'Milk'
    milk.amount = '1/2 gallon'
    milk.grocery_list_id = 1
    milk.save!
    
    ham = Item.new
    ham.name = 'Ham'
    ham.amount = '3 slices'
    ham.grocery_list_id = 1
    ham.save!
    
    bread = Item.new
    bread.name = 'Bread'
    bread.amount = '1 loaf'
    bread.grocery_list_id = 2
    bread.save!
    
    cereal = Item.new
    cereal.name = 'Lucky Charms'
    cereal.amount = '11 boxes'
    cereal.grocery_list_id = 2
    cereal.save!    
    
    # Orders
    
    order1 = Order.new
    order1.placed_on = DateTime.new(2015, 1, 2, 3, 4, 5, '+7')
    order1.tip = 10
    order1.notes = 'All organic please!'
    order1.buyer_id = 1
    order1.shopper_id = 2
    order1.grocery_list_id = 1
    order1.save!
    
    order2 = Order.new
    order2.placed_on = DateTime.new(2015, 1, 2, 5, 4, 3, '+7')
    order2.tip = 12
    order2.notes = 'No GMOs please!'
    order2.buyer_id = 2
    order2.shopper_id = 1
    order2.grocery_list_id = 2
    order2.save!

  end
end
