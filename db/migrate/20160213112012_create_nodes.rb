class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :l_weight
      t.integer :g_weight
      t.integer :u_weight
      t.string :queue

      t.timestamps null: false
    end
  end
end
