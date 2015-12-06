class Karma2 < ActiveRecord::Migration
  def self.up
	change_table :users do |t|
	  t.change :karma, :integer, :default => 0
	end
  end

  def self.down
  end
end
