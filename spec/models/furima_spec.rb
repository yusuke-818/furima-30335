require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe '商品出品機能' do
    context '出品出来るとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@furima).to be_valid
      end

      it '価格の範囲が¥300〜¥9,999,999であること' do
        @furima.price = 500
        expect(@furima).to be_valid
      end

      it '価格が半角数字であれば保存出来ること' do
        @furima.price = 500
        expect(@furima).to be_valid
      end
    end

    context '出品出来ないとき' do
      it 'imageが空では保存されないこと' do
        @furima.image = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Image can't be blank")
      end

      it 'itemが空では保存されないこと' do
        @furima.item = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Item can't be blank")
      end

      it 'infoが空では保存されないこと' do
        @furima.info = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Info can't be blank")
      end

      it 'categoryを選択していないと保存できないこと' do
        @furima.category_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include('Category must be other than 1')
      end

      it 'statesを選択していないと保存できないこと' do
        @furima.states_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include('States must be other than 1')
      end

      it 'shippingを選択していないと保存できないこと' do
        @furima.shipping_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include('Shipping must be other than 1')
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @furima.prefecture_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'shipping_dayを選択していないと保存できないこと' do
        @furima.shipping_days_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include('Shipping days must be other than 1')
      end

      it 'priceが空では保存されないこと' do
        @furima.price = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300未満であれば保存できないこと' do
        @furima.price = 299
        @furima.valid?
        expect(@furima.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceが¥10,000,000以上であれば保存できないこと' do
        @furima.price = 10_000_000
        @furima.valid?
        expect(@furima.errors.full_messages).to include('Price is out of setting range')
      end

      it '価格が半角英数字混合では出品出来ない' do
        @furima.price = '1o0'
        @furima.valid?
        expect(@furima.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end

      it '価格が半角英字のみでは出品出来ない' do
        @furima.price = 'OOO'
        @furima.valid?
        expect(@furima.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end

      it '価格が全角文字では出品できない' do
        @furima.price = '１０００'
        @furima.valid?
        expect(@furima.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
    end
  end
end
