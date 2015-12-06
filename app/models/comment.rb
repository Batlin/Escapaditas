class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	has_many :respuesta

   validates :nombre, :latitude, :longitude, :zoom, :comment, :site_id, :presence => true
   validates_uniqueness_of :nombre, :case_sensitive => false

	attr_protected :user_id
end
