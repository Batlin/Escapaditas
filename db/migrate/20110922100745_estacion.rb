class Estacion < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|  # añade la columna visits a la tabla sites
      	t.column :estacion, :integer
    end
  end

  def self.down
 change_table :comments do |t|
      t.remove :estacion
    end
  end

end
