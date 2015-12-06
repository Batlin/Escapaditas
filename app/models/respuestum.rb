class Respuestum < ActiveRecord::Base
 belongs_to :comment
 belongs_to :user

   validates :description, :comment_id, :presence => true

 attr_protected :user_id

   make_flaggable :opinion
end
