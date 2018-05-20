class Note < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :collections, :join_table => 'notes_collections'

  after_create do
    note = Note.find_by(id: self.id)
    collections_c = self.body.scan(/#\w+/)
    collections_c.uniq.map do |collection|
      collect = Collection.find_or_create_by(name: collection.downcase.delete('#'))
      note.collections << collect
    end
  end

  before_update do
    note = Note.find_by(id: self.id)
    note.collections.clear
    collections_c = self.body.scan(/#\w+/)
    collections_c.uniq.map do |collection|
      collect = Collection.find_or_create_by(name: collection.downcase.delete('#'))
      note.collections << collect
    end
  end

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
