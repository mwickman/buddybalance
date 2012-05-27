# == Schema Information
#
# Table name: buddies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
# password_digest
class Buddy < ActiveRecord::Base
  attr_accessible :name, :email, :bio, :password, :password_confirmation
  has_secure_password

  before_save { |buddy| buddy.email = email.downcase } 

  validates :name, :presence => true, :length => { :maximum => 50 }
  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true
end
