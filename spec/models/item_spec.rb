require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '出品登録の成功' do
      it '入力必須項目の全てが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品登録の失敗（未入力）' do
      it '出品画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.name_of_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name of item can't be blank")
      end
      it '商品の説明がないと登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it '商品の詳細（カテゴリー）がないと登録できない' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Item category is not a number')
      end
      it '商品の詳細（商品の状態）がないと登録できない' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition is not a number')
      end
      it '配送について（配送料の負担）がないと登録できない' do
        @item.who_expense_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Who expense is not a number')
      end
      it '配送について（発送元の地域）がないと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '配送について（発送までの日数）がないと登録できない' do
        @item.days_to_shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to shipment is not a number')
      end
      it '販売価格がないと登録できない' do
        @item.sales_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price is not a number', 'Sales price is invalid')
      end
    end

    context '出品登録の失敗(ActiveHash)' do
      it '商品の詳細（カテゴリー）のidが 1 の場合登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item category must be other than 1')
      end
      it '商品の詳細（商品の状態）のidが 1 の場合登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition must be other than 1')
      end
      it '配送について（配送料の負担）のidが 1 の場合と登録できない' do
        @item.who_expense_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Who expense must be other than 1')
      end
      it '配送について（発送元の地域）のidが 1 の場合登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '配送について（発送までの日数）のidが 1 の場合登録できない' do
        @item.days_to_shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to shipment must be other than 1')
      end
    end

    context '出品登録の失敗（販売価格）' do
      it '販売価格が300円未満では登録できない' do
        @item.sales_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price must be greater than 299')
      end
      it '販売価格が10000000円以上では登録できない' do
        @item.sales_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price must be less than 10000000')
      end
      it '販売価格は半角数字でないと登録できない' do
        @item.sales_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price is not a number')
      end
    end
  end
end
