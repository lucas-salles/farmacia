class CreateSaleDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_details do |t|
      t.decimal :price, null:false
      t.references :sale, :medicament

      t.timestamps
    end
  end
end
