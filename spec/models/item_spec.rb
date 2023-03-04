require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品ができる場合' do
      it '必要な情報を適切に入力すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'ファイルが選択されてなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が未入力では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it '商品説明が未入力では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end
      
      it 'カテゴリーが未選択では出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が未選択では出品できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it '配送料の負担が未選択では出品できない' do
        @item.postage_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end

      it '発送元の地域が未選択では出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送までの日数が未選択では出品できない' do
        @item.shipping_day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end

      it '価格が未入力では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が全角入力では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price input half-width characters"
      end

      it '価格が300円未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price out of setting range"
      end

      it '価格が10,000,000円以上では出品できない' do
        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price out of setting range"
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
