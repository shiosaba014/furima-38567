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

  validates :image, :name, :explan, presence: true
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は¥300~¥9,999,999の範囲で半角数字で入力してください' }, presence: true
  validates :category_id, :situation_id, :delivery_charge_id, :address_id, :period_id,
            numericality: { other_than: 1, message: "を選択してください" }
end
