class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :date_sale, null:false
      t.integer :user_id, null:false
      t.string :user, null:false

      t.timestamps
    end
  end
end
