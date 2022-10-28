class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :address
  belongs_to :period
  belongs_to :user
  has_one_attached :image


  validates :image,:name,:explan,:price, presence: true
  validates :category_id,:situation_id,:delivery_charge_id,:address_id,:period_id, numericality: { other_than:1 , message:"can't be blank"}
end
