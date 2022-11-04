require 'rails_helper'

RSpec.describe ConsumerBuyer, type: :model do
  describe '購入者情報の保存' do
      before do
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item)
        @consumer_buyer = FactoryBot.build(:consumer_buyer,user_id: user.id,item_id:item.id)
      end
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されれば保存できる' do
        expect(@consumer_buyer).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @consumer_buyer.building = ''
        expect(@consumer_buyer).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できない' do
        @consumer_buyer.post_code = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeにハイフンが入ってないと保存できない' do
        @consumer_buyer.post_code = '1234567'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to  include "Post code is invalid"
      end
      it 'address_idで初期値意外を選択していないと保存できない' do
        @consumer_buyer.address_id = 1
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Address can't be blank"
      end
      it 'municipaltiesが空だと保存できない' do
        @consumer_buyer.municipalities = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'address_numberが体と保存できない' do
        @consumer_buyer.address_number = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Address number can't be blank"
      end
      it 'telが空だと保存できない' do
        @consumer_buyer.tel = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Tel can't be blank"
      end
      it 'telにハイフンが入ってると保存できない' do
        @consumer_buyer.tel = '090-0000-0000'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Tel is invalid"
      end
      it 'telは9桁以下では保存できない' do
        @consumer_buyer.tel = '123456789'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Tel is invalid"
      end
      it 'telは12桁以上では保存できない' do
        @consumer_buyer.tel = '123456789012'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Tel is invalid"
      end
      it 'telは半角数字でないと保存できない' do
        @consumer_buyer.tel = '１２３４５６７８９０１'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Tel is invalid"
      end
      it 'userが紐づいてないと保存できない' do
        @consumer_buyer.user_id = nil
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいてないと保存できない' do
        @consumer_buyer.item_id = nil
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenは空だと保存できない' do
        @consumer_buyer.token = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
