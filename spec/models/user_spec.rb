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
        expect(@user.errors.full_messages).to include"Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailは@を含まないと登録できない' do
      @user.email = 'test.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include"Email is invalid"
      end
      it '同じemailがある場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include"Email has already been taken"
      end
      it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include"Password can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = "test1111"
      @user.password_confirmation = "test2222"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'family_nameが空だと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_name_kanaが空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birthが空だと登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
      end
      it "passwordが６文字以下だと登録できない" do
      @user.password = 'q1'
      @user.password_confirmation = 'q1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = 'tttttt'
      @user.password_confirmation = 'tttttt'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password . Include both letters and numbers"
      end
      it 'family_nameが全角じゃないと登録できない' do
      @user.family_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name . Input full-width characters"
      end
      it 'first_nameが全角じゃないと登録できない' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name . Input full-width characters"
      end
      it 'family_name_kanaはカタカナじゃないと登録できない' do
      @user.family_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana . Input full-width katakana characters"
      end
      it 'first_name_kanaはカタカナじゃないと登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana . Input full-width katakana characters"
      end
    end
  end
end
