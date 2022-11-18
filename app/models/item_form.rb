class ItemForm
  include ActiveModel::Model

  attr_accessor :name, :explan, :category_id, :situation_id,
                :delivery_charge_id, :address_id, :period_id,
                :price, :image,:user_id

                validates :image, :name, :explan, presence: true
                validates :price,
                          numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                          message: 'は¥300~¥9,999,999の範囲で半角数字で入力してください' }, presence: true
                validates :category_id, :situation_id, :delivery_charge_id, :address_id, :period_id,
                          numericality: { other_than: 1, message: "を選択してください" }
  def save
    Item.create(name: name, explan: explan, category_id: category_id, situation_id: situation_id,
                delivery_charge_id: delivery_charge_id, address_id: address_id, period_id: period_id,
                price: price, image: image,user_id: user_id)
  end
end