class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.decimal :amount, precision: 8, scale: 2
      t.boolean :confirmed
      t.integer :creator
      t.integer :target

      t.timestamps
    end
  end
end
