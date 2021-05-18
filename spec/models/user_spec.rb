require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
    it 'nicknameとemail、passwordとpassword_confirmationがあれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameは6文字までなら登録できる' do
    @user.nickname = 'あaA12'
    expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが一致し、かつ6文字以上の半角英数字であれば登録できる' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end
  end

   context '新規登録がうまくいかないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''  # passwordの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください"
    end
    it 'passwordは6文字以下では登録できない' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
    end
    it 'passwordとpassword_confirmationの値が一致していなければ登録できない' do
      @user.password = '000aaa'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end
   end
  end
end
