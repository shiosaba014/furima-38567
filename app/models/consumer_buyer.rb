class ConsumerBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :address_id, :municipalities, :address_number, :building, :tel, :user_id, :item_id, :token

  validates :municipalities, :address_number, :token, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :tel, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :user_id, :item_id, presence: true
  validates :address_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    consumer = Consumer.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, address_id: address_id, municipalities: municipalities, address_number: address_number,
                 building: building, tel: tel, consumer_id: consumer.id)
  end
end
