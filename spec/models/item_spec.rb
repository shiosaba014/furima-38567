require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品登録' do
    context '商品の登録ができる時' do
      it '入力必須な項目が存在すれば登録できる' do
      expect(@item).to be_valid
      end
    end

    context '商品の登録ができない時' do
      it '商品画像は必須' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品の名前は必須' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明は必須' do
      @item.explan = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Explan can't be blank"
      end
      it '商品のカテゴリー選択は、初期値では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態の選択は、初期値では登録できない' do
      @item.situation_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Situation can't be blank"
      end
      it '配送料の情報の選択は、初期値では登録できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it '発送元の情報は、初期値では登録できない' do
      @item.address_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Address can't be blank"
      end
      it '発送までの日数は、初期値では登録できない' do
      @item.period_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Period can't be blank"
      end
      it '値段の入力は必須' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '値段は¥300~¥9,999,999の範囲でのみしか登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it '値段は半角でしか登録できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
    end
  end
end
