class Tipositio < ActiveRecord::Migration
  def self.up
    change_table :sites do |t|  # añade la columna visits a la tabla sites
      	t.column :tipositio, :integer
    end
  end

  def self.down
 change_table :sites do |t|
      t.remove :tipositio
    end
  end
end
