class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :user_id
      t.string :ip_adress
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
