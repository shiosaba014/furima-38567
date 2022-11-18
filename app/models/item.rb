class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :address
  belongs_to :period
  belongs_to :user
  has_one :consumer
  has_one_attached :image
  has_many :item_tag_relations, foreign_key: :item_id, dependent: :destroy
  has_many :tags, through: :item_tag_relations

end
