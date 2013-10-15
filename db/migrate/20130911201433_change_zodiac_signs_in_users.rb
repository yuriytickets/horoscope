class ChangeZodiacSignsInUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.rename :zodiac_sign, :zodiac
    end
  end

  def down
    change_table :users do |t|
      t.rename :zodiac_sign, :zodiac
    end
  end
end
