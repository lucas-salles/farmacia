class CreateMedicaments < ActiveRecord::Migration[5.2]
  def change
    create_table :medicaments do |t|
      t.string :name, null:false
      t.string :description, null:false
      t.decimal :price, null:false

      t.timestamps
    end
  end
end
