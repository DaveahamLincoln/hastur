class CreateLocalChannels < ActiveRecord::Migration
  def change
    create_table :local_channels do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
