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
        expect(@consumer_buyer.errors.full_messages).to include "郵便番号を入力してください"
      end
      it 'post_codeにハイフンが入ってないと保存できない' do
        @consumer_buyer.post_code = '1234567'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to  include "郵便番号は不正な値です"
      end
      it 'address_idで初期値意外を選択していないと保存できない' do
        @consumer_buyer.address_id = 1
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "都道府県は1以外の値にしてください"
      end
      it 'municipaltiesが空だと保存できない' do
        @consumer_buyer.municipalities = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "市区町村を入力してください"
      end
      it 'address_numberが体と保存できない' do
        @consumer_buyer.address_number = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "番地を入力してください"
      end
      it 'telが空だと保存できない' do
        @consumer_buyer.tel = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "電話番号を入力してください"
      end
      it 'telにハイフンが入ってると保存できない' do
        @consumer_buyer.tel = '090-0000-0000'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "電話番号は不正な値です"
      end
      it 'telは9桁以下では保存できない' do
        @consumer_buyer.tel = '123456789'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "電話番号は不正な値です"
      end
      it 'telは12桁以上では保存できない' do
        @consumer_buyer.tel = '123456789012'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "電話番号は不正な値です"
      end
      it 'telは半角数字でないと保存できない' do
        @consumer_buyer.tel = '１２３４５６７８９０１'
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "電話番号は不正な値です"
      end
      it 'userが紐づいてないと保存できない' do
        @consumer_buyer.user_id = nil
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Userを入力してください"
      end
      it 'itemが紐づいてないと保存できない' do
        @consumer_buyer.item_id = nil
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "Itemを入力してください"
      end
      it 'tokenは空だと保存できない' do
        @consumer_buyer.token = ''
        @consumer_buyer.valid?
        expect(@consumer_buyer.errors.full_messages).to include "カード情報を入力してください"
      end
    end
  end
end
