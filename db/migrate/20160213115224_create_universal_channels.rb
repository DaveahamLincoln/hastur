class CreateUniversalChannels < ActiveRecord::Migration
  def change
    create_table :universal_channels do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
