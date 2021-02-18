require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録の失敗（未入力）' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが存在してもパスワード（確認）が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前（全角）:姓が空では登録できない' do
        @user.last_name_em = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name em can't be blank")
      end
      it 'お名前（全角）:名が空では登録できない' do
        @user.first_name_em = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name em can't be blank")
      end
      it 'お名前カナ（全角）：姓が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ（全角）：名が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    context '新規登録の失敗（メールアドレス）' do
      it 'メールアドレスを重複して登録はできない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに @ 無しでは登録はできない' do
        @user.email = 'test_taro.test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
    
    context '新規登録の失敗（パスワード）' do
      it 'パスワードは５文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードには英字と数字の両方を含めないと登録できない(数字のみ）' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードには英字と数字の両方を含めないと登録できない(英字のみ）' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない(英字のみ）' do
        @user.password = 'taro123'
        @user.password_confirmation = 'hanako123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end      
    end
  end
end
