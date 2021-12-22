class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.integer :branch_id
      t.integer :private_number
      t.string :email
      t.integer :check_in_out_id
      t.boolean :active
      #t.branch :belongs_to
      #t.check_in_out :belongs_to

      #belongs/foregein keys
      t.belongs_to :branches
      t.belongs_to :check_in_outs

      t.timestamps
    end
  end
end
