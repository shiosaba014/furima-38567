class BuyerConsumer
  include ActiveModel::Model
  attr_accessor :post_code,:address_id,:municipalities,:address_number,:building,:tel,:consumer_id,:user_id,:item_id

  validates :post_code,:address_id,:municipalities,:address_number,:tel,presence: true
  validates :user_id,:consumer_id,:item_id,presence:true

  def save
  Buyer.create(post_code: post_code,address_id: address_id,municipalities: municipalities,address_number: address_number,building: building,tel: tel,consumer_id: consumer_id)

  consumer = Consumer.create(user_id: user.id,item_id: item.id)
  
  end
end