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
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
   end
  end
end
