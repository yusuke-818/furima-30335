require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @furima = FactoryBot.create(:furima)
    @user_order = FactoryBot.build(:user_order, user_id: @user.id, furima_id: @furima.id)
    sleep 0.1
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できるとき' do
      it '全ての情報が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @user_order.building = ''
        expect(@user_order).to be_valid
      end
    end

    context '配送先情報がうまく保存できないとき' do
      it 'postal_codeが空では登録できないこと' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは-がなければ保存されないこと' do
        @user_order.postal_code = '1112222'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code Include hyphen(-)')
      end
      it 'cityが空では登録できないこと' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空では登録できないこと' do
        @user_order.addresses = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空では登録できないこと' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは数字のみでないと登録できないこと' do
        @user_order.phone_number = '090abcdefgh'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number Input only number')
      end
      it 'prefectureは選択しないと登録できないこと' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Prefecture Select')
      end
      it 'tokenが空では登録できないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @user_order.user_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
