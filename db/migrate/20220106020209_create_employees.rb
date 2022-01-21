class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.string :email
      t.boolean :active
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
