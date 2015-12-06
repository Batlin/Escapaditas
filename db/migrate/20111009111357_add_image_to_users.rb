class AddImageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.column :image_url, :string
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :image_url
    end
  end
end
