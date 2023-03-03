require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'testpass'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

     it 'emailは@を含まないと登録できない' do
        @user.email = 'testaddress'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

     it 'passwordが5文字以下では登録できない' do
       @user.password = 'test'
       @user.password_confirmation = 'test'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = 'testpass'
        @user.password_confirmation = 'testpass'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end

      it 'お名前（姓）が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end

      it 'お名前（名）が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'お名前（姓）が全角入力でなければ登録できない' do
        @user.family_name = 'ﾋﾉ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name Input full-width characters"
      end

      it 'お名前（名）が全角入力でなければ登録できない' do
        @user.first_name = 'ｼｭﾝ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name Input full-width characters"
      end

      it 'お名前（姓・カナ）が空では登録できない' do
        @user.family_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name reading can't be blank"
      end

      it 'お名前（名・カナ）が空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name reading can't be blank"
      end

      it 'お名前（姓・カナ）がカタカナ全角入力でなければでは登録できない' do
        @user.family_name_reading = 'ﾋﾉ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name reading Input full-width katakana characters"
      end

      it 'お名前（名・カナ）がカタカナ全角入力でなければ登録できない' do
        @user.first_name_reading = 'ｼｭﾝ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name reading Input full-width katakana characters"
      end

      it '誕生日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

    end

  end
  
end
