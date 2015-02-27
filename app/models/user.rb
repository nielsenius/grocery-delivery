class User < ActiveRecord::Base

  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
 
  validates_presence_of :phone_number
  validates_format_of :phone_number, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"

  validates_inclusion_of :location, in: %w[Boss Donner Hamerschlag McGill Morewood-E-Tower Morewood-Gardens Mudge Resnik Scobell Stever Welch West-Wing Clyde Doherty Fairfax Margaret-Morrison Neville Residence-on-Fifth Roselawn Shady-Oak Shirley Webster Woodlawn]

  def name
    "#{self.last_name}, #{self.first_name}"
  end

  def proper_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.authenticate(username,password)
    find_by_username(username).try(:authenticate, password)
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
end
