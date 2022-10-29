class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :address
  belongs_to :period
  belongs_to :user
  has_one_attached :image


  validates :image,:name,:explan, presence: true
  validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,message:'is out of setting range'},format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters'}, presence:true
  validates :category_id,:situation_id,:delivery_charge_id,:address_id,:period_id, numericality: { other_than:1 , message:"can't be blank"}
end
