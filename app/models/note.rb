class Note < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  
  attr_accessor :cover

  def self.search(search)
    if search
      where (["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end

  after_save :save_cover_image, if: :cover

  def save_cover_image
    filename = cover.original_filename
    folder = "public/imagePost/#{id}/post"

    FileUtils::mkdir_p folder

    f = File.open File.join(folder, filename), "wb"
    f.write cover.read()
    f.close

    self.cover = nil
    update imagenPost: filename
  end


end
