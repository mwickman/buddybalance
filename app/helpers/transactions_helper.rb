class TransactionsValidator < ActiveModel::Validator
  def validate(record)
    if record.amount.eql?(0)
      record.errors[:amount] << 'Amount cannot be zero'
    end    
  end
end

module TransactionsHelper
  
  
end
