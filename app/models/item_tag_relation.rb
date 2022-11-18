class ItemTagRelation < ApplicationRecord
  belongs_to :item
  belongs_to :tag
  validates :tag_name, uniqueness: true
end
