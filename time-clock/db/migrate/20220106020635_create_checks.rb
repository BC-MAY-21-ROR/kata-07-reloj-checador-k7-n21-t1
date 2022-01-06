class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|
      t.datetime :entrance
      t.datetime :out
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
