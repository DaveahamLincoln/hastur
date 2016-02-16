class CreateGlobalChannels < ActiveRecord::Migration
  def change
    create_table :global_channels do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
