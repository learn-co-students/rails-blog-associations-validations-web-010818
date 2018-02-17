class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  validates :name, :content, presence: true
  accepts_nested_attributes_for :tags

  def tags_attributes=(tags)
    self.tags.clear ## clear current tags and add only tags selected
    tags["ids"] = tags["ids"].reject { |t| t.empty? }
    tags["ids"].each do |tag_id|
      found_tag = Tag.find_by(id: tag_id.to_i)
      if !self.tags.include?(found_tag) ## Only add each tag if it isn't already associated
        self.tags << found_tag
      end
    end
  end

end
