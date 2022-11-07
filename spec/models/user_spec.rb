require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '入力必須な項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時'
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'test.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
    end
    it '同じemailがある場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'test1111'
      @user.password_confirmation = 'test2222'
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end
    it 'family_nameが空だと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "名字を入力してください"
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "名前を入力してください"
    end
    it 'family_name_kanaが空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "名字（フリガナ）を入力してください"
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "名前（フリガナ）を入力してください"
    end
    it 'birthが空だと登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "生年月日を入力してください"
    end
    it 'passwordが６文字以下だと登録できない' do
      @user.password = 'q1'
      @user.password_confirmation = 'q1'
      @user.valid?
      expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
    end
    it 'passwordは半角英字のみでは登録できない' do
      @user.password = 'tttttt'
      @user.password_confirmation = 'tttttt'
      @user.valid?
      expect(@user.errors.full_messages).to include 'パスワードは英字と数字の両方を含んでください'
    end
    it 'passwordは数字のみでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'パスワードは英字と数字の両方を含んでください'
    end
    it '全角を含むpasswordでは登録できない' do
      @user.password = '一二三四五六七'
      @user.password_confirmation = '一二三四五六七'
      @user.valid?
      expect(@user.errors.full_messages).to include 'パスワードは英字と数字の両方を含んでください'
    end
    it 'family_nameが全角じゃないと登録できない' do
      @user.family_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include '名字は全角で入力してください'
    end
    it 'first_nameが全角じゃないと登録できない' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include '名前は全角で入力してください'
    end
    it 'family_name_kanaはカタカナじゃないと登録できない' do
      @user.family_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include '名字（フリガナ）はカタカナで入力してください'
    end
    it 'first_name_kanaはカタカナじゃないと登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include '名前（フリガナ）はカタカナで入力してください'
    end
  end
end
