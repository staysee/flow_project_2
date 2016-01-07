class Tag < ActiveRecord::Base
  # attr_accessible :name
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings,  dependent: :destroy

  def self.counts
    self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id, tags.name")
  end
end
