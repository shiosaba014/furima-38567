class ItemForm
  include ActiveModel::Model

  attr_accessor(
    :name, :explan, :category_id, :situation_id,
    :delivery_charge_id, :address_id, :period_id,
    :price, :images,:user_id,
    :id ,:created_at, :updated_at,
    :tag_name
  )

                validates :images, :name, :explan, presence: true
                validates :images, length:{ minimum: 1,maximum: 5,message: "は1枚以上5枚以下にしてください" }
                validates :price,
                          numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                          message: 'は¥300~¥9,999,999の範囲で半角数字で入力してください' }, presence: true
                validates :category_id, :situation_id, :delivery_charge_id, :address_id, :period_id,
                          numericality: { other_than: 1, message: "を選択してください" }
  def save
    item = Item.create(name: name, explan: explan, category_id: category_id, situation_id: situation_id,
                delivery_charge_id: delivery_charge_id, address_id: address_id, period_id: period_id,
                price: price, images: images,user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
  def update(params,item)
    item.item_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    item.update(params)
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end
end