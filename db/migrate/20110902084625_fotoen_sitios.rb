class FotoenSitios < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|  # añade la columna visits a la tabla sites
      	t.column :image_url, :string
    end
  end

  def self.down
 change_table :comments do |t|
      t.remove :image_url
    end
  end
end
