class CommentTitulo < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|  # añade la columna visits a la tabla sites
      	t.column :nombre, :string
    end
  end

  def self.down
 change_table :comments do |t|
      t.remove :nombre
    end
  end
end
