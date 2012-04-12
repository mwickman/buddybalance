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

require 'spec_helper'

describe Buddy do
  before do
    @buddy = Buddy.new name: "Alex", email: "alex@pause-break.net"
  end

  subject { @buddy }

  it { should respond_to :name }
  it { should respond_to :email }
end

