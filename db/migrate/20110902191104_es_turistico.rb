class EsTuristico < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|  # añade la columna visits a la tabla sites
      	t.column :esturistico, :integer
    end
  end

  def self.down
 change_table :comments do |t|
      t.remove :esturistico
    end
  end
end
