class AddZodiacSignToUsers < ActiveRecord::Migration
  def change
    add_column :users, :zodiac_sign, :string
  end
end
