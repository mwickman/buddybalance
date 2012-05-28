class Transaction < ActiveRecord::Base
  attr_accessible :amount, :creator, :target, :confirmed
  
  before_save :round
  
  validates_with TransactionsValidator
  validates :creator, :presence => true
  validates :target, :presence => true
  
  
  private
    def round
      self.amount = self.amount.round(2)
    end
    
    
end
