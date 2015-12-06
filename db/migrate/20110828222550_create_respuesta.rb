class CreateRespuesta < ActiveRecord::Migration
  def self.up
    create_table :respuesta do |t|
      t.text :description
      t.integer :comment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :respuesta
  end
end
