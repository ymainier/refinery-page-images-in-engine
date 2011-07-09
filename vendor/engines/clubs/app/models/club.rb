class Club < ActiveRecord::Base
  attr_accessible :name, :position, :logo_id, :description
  
  acts_as_indexed :fields => [:name, :description]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :logo, :class_name => 'Image'

  has_many_page_images

end
