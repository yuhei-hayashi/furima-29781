require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入履歴及び住所の登録' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
    context '登録が上手くいくとき' do
      it 'post_code,area_id,city,house_number,building,telephone全てが存在する場合登録できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが存在しなくても登録できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end
    context '登録が上手くいかないとき' do
      it 'post_codeが空の場合登録出来ない' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに-がない場合登録出来ない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeが7桁でない場合登録出来ない' do
        @order_address.post_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'area_idが空の場合登録出来ない' do
        @order_address.area_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが0の場合登録出来ない' do
        @order_address.area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Area must be other than 0')
      end
      it 'cityが空の場合登録出来ない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空の場合登録出来ない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephoneが空の場合登録出来ない' do
        @order_address.telephone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが11桁より多い場合登録出来ない' do
        @order_address.telephone = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneに数字以外の入力がある場合登録出来ない' do
        @order_address.telephone = '123456789ab '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'tokenが空の場合登録出来ない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
