class Picture < ApplicationRecord
  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  validates :artist, prescence: true
  validates :title, presence: true length: {minimum: 3, maximum: 20}
  validates :url, presence: true, uniqueness: true
end
