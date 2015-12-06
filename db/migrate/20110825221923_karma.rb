class Karma < ActiveRecord::Migration
  def self.up
    change_table :users do |t|  # añade la columna visits a la tabla sites
      	t.column :karma, :integer, :default => 0
    end
  end

  def self.down
 change_table :users do |t|
      t.remove :karma
    end
  end
end
