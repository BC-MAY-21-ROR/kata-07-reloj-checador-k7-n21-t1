class CreateCheckInOuts < ActiveRecord::Migration[6.1]
  def change
    create_table :check_in_outs do |t|
      t.datetime :entrance
      t.datetime :out

      t.timestamps
    end
  end
end
