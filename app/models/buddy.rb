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

class Buddy < ActiveRecord::Base
  attr_accessible :name, :email, :bio
end
