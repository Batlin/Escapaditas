class TipoComentario < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|  # añade la columna visits a la tabla sites
      	t.column :tipocomentario, :integer
    end
  end

  def self.down
 change_table :comments do |t|
      t.remove :tipocomentario
    end
  end

end
