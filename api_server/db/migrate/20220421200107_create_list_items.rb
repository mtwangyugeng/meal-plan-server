class CreateListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_items do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
