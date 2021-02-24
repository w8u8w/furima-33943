require 'rails_helper'

RSpec.describe PurchasesShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchases_shipping = FactoryBot.build(:purchases_shipping, user_id: user.id, item_id: item.id)
  end

  describe '商品の購入登録' do
    context '商品の購入成功' do
      it '入力必須項目の全てが存在すれば購入できる' do
        expect(@purchases_shipping).to be_valid
      end

      it '建物名がなくても購入できる' do
        @purchases_shipping.building_name = ''
        expect(@purchases_shipping).to be_valid
      end
    end

    context '商品の購入失敗(未入力)' do
      it '郵便番号がないと購入できない' do
        @purchases_shipping.post_code = ''
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Post code can't be blank",
                                                                    'Post code is invalid. Include hyphen(-)')
      end
      it '都道府県を指定しないと購入できない' do
        @purchases_shipping.prefecture_id = nil
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Prefecture is not a number')
      end
      it '市区町村がないと購入できない' do
        @purchases_shipping.municipality = ''
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地がないと購入できない' do
        @purchases_shipping.block_number = ''
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号がないと購入できない' do
        @purchases_shipping.phone_number = ''
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end

      it 'tokenがないと購入できない' do
        @purchases_shipping.token = nil
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end

    context '商品の購入失敗（ActiveHash）' do
      it '都道府県のidが 1 の場合購入できない' do
        @purchases_shipping.prefecture_id = 1
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Prefecture must be other than 1')
      end
    end

    context '商品の購入失敗（入力不適合）' do
      it '郵便番号にハイフンがない場合購入できない' do
        @purchases_shipping.post_code = '1234567'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '電話番号が12桁以上の場合購入できない' do
        @purchases_shipping.phone_number = '123456789012'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号にハイフンが含まれると登録できない' do
        @purchases_shipping.phone_number = '123-4567-8901'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
