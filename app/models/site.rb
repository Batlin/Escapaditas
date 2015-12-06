class Site < ActiveRecord::Base

   belongs_to :type
   belongs_to :user

  validate do |site|
    site.errors.add_to_base("El nombre no puede estar vacio") if site.name.blank?
  end
   validates :type_id, :latitude, :longitude, :zoom, :tipositio, :presence => true
   validates :zoom, :numericality => {:greater_than_or_equal_to => 0.1}
   validates_uniqueness_of :name, :case_sensitive => false

   # Prevents the assignation of sites to other users
   attr_protected :user_id

   has_many :comments

   make_flaggable :estado
end
