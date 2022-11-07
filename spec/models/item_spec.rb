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
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it '商品の名前は必須' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it '商品の説明は必須' do
        @item.explan = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it '商品のカテゴリー選択は、初期値では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it '商品の状態の選択は、初期値では登録できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it '配送料の情報の選択は、初期値では登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end
      it '発送元の情報は、初期値では登録できない' do
        @item.address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it '発送までの日数は、初期値では登録できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it '値段の入力は必須' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end
      it '値段は¥300以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は¥300~¥9,999,999の範囲で半角数字で入力してください'
      end
      it '値段が値段が¥9,999,999以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は¥300~¥9,999,999の範囲で半角数字で入力してください'
      end
      it '値段は半角でしか登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は¥300~¥9,999,999の範囲で半角数字で入力してください'
      end
      it 'userモデルと紐づいてないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
