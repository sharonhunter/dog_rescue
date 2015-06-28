class Dog < ActiveRecord::Base
  has_attached_file :image, styles: { large: "500x500>", medium: "300x300>", thumb: "150x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  #alternative search method
    #scope :by_name, -> (name) { where name: name }
    #scope :by_gender, -> (gender) { where gender: gender }
    #scope :by_breed, -> (breed) { where breed: breed }

  def self.search(search)
  	#Rails 4.2 will only return the LAST where results if listed on separate lines
    #Postgres's ILIKE below replaced LIKE to create case-insensitive search
    # "%" + search + "%" to prevent SQL injection
    where("name ILIKE ? OR breed ILIKE ? OR gender ILIKE ?", "%" + search + "%", "%" + search + "%", "%" + search + "%")# will work
  end

end
