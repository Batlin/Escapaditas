class AddRoles < ActiveRecord::Migration
  def self.up
    change_table :users do |t|  # añade la columna visits a la tabla sites
      	t.column :role, :integer, :default => 1
    end
  end

  def self.down
 change_table :users do |t|
      t.remove :role
    end
  end
end
