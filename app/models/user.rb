class User < ActiveRecord::Base
  
  LOCATIONS = %w[Boss Donner Hamerschlag McGill Morewood-E-Tower Morewood-Gardens Mudge Resnik Scobell Stever Welch West-Wing Clyde Doherty Fairfax Margaret-Morrison Neville Residence-on-Fifth Roselawn Shady-Oak Shirley Webster Woodlawn]
  ROLES = [['Administrator', :admin], ['Member', :member]]
  
  has_secure_password
  
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 6, message: "must be at least 6 characters long", allow_blank: true
  
  validates_presence_of :phone_number
  validates_format_of :phone_number, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"
  
  validates_inclusion_of :location, in: LOCATIONS

  def role?(authorized_role)
    return false if role.nil?
    role.to_sym == authorized_role
  end
  
  def name
    "#{self.last_name}, #{self.first_name}"
  end
  
  def proper_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def self.authenticate(phone_number, password)
    find_by_username(phone_number).try(:authenticate, password)
  end
  
end
