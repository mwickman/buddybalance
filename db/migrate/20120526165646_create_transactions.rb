class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.decimal :amount
      t.boolean :confirmed
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
