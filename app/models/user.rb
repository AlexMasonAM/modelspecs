class User < ActiveRecord::Base
  validates_presence_of :firstname, :lastname
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  
  def fullname #instance method
    # "#{self.firstname} #{self.lastname}" //Uses the ruby variables
    firstname + " " + lastname
  end
end
