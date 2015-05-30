class Dog < ActiveRecord::Base
  has_attached_file :image, styles: { large: "500x500>", medium: "300x300>", thumb: "150x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :by_name, -> (name) { where name: name }
  scope :by_gender, -> (gender) { where gender: gender }
  scope :by_breed, -> (breed) { where breed: breed }
end
