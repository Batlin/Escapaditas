class UserRespuesta < ActiveRecord::Migration
def self.up
    change_table :respuesta do |t|  # añade la columna user_id a la tabla sites
      t.column :user_id, :integer
    end
  end
def self.down
    change_table :respuesta do |t|
      t.remove :user_id
    end
  end
end
