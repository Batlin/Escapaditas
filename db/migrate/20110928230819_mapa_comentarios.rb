class MapaComentarios < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|  # añade la columna visits a la tabla sites
      	t.column :latitude, :decimal
      	t.column :longitude, :decimal
      	t.column :zoom, :decimal
    end
  end

  def self.down
 change_table :comments do |t|
      	t.remove :latitude, :decimal
      	t.remove :longitude, :decimal
      	t.remove :zoom, :decimal
    end
  end
end
