class Type < ActiveRecord::Base
   has_many :sites
   
   validates :name, :presence => true  
   validates :name, :uniqueness => true 
end
