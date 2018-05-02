class User < ApplicationRecord
  has_many :notes, :dependent => :destroy

  def self.search(search)
    if search
      where (["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end

  attr_accessor :cover
 after_save :save_cover_image, if: :cover

 def save_cover_image
   filename = cover.original_filename
   folder = "public/imageAvatar/#{id}/avatar"

   FileUtils::mkdir_p folder

   f = File.open File.join(folder, filename), "wb"
   f.write cover.read()
   f.close

   self.cover = nil
   update cover_filename: filename
 end

   validates :email, :uniqueness => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
   validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
   validates :password, :confirmation => true #password_confirmation attr
   validates_length_of :password, :in => 6..20, :on => :create
end
