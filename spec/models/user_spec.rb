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
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
   end

   context '新規登録がうまくいかないとき' do
   end
  end
end
