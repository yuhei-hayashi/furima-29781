require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/sample_image.jpg')
    end
    context '商品出品が上手くいくとき' do
      it 'name,explanation,user_id,area_id,day_id,status_id,genre_id,delivery_id,priceがが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'area_idが０以外なら登録できる' do
        @item.area_id = 1
        expect(@item).to be_valid
      end
      it 'day_idが０以外なら登録できる' do
        @item.day_id = 1
        expect(@item).to be_valid
      end
      it 'status_idが０以外なら登録できる' do
        @item.status_id = 1
        expect(@item).to be_valid
      end
      it 'genre_idが０以外なら登録できる' do
        @item.genre_id = 1
        expect(@item).to be_valid
      end
      it 'delivery_idが０以外なら登録できる' do
        @item.delivery_id = 1
        expect(@item).to be_valid
      end
      it 'priceの範囲が300以上9999999以下であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '商品出品が上手くいかないとき' do
      it 'nameが空の場合登録出来ない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空の場合登録出来ない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'imageが空の場合登録出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'area_idが空の場合登録出来ない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Area is not a number')
      end
      it 'area_idが0の場合登録出来ない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 0')
      end
      it 'day_idが空の場合登録出来ない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Day is not a number')
      end
      it 'day_idが0の場合登録出来ない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 0')
      end
      it 'status_idが空の場合登録出来ない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it 'status_idが0の場合登録出来ない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it 'genre_idが空の場合登録出来ない' do
        @item.genre_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre is not a number')
      end
      it 'genre_idが0の場合登録出来ない' do
        @item.genre_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre must be other than 0')
      end
      it 'delivery_idが空の場合登録出来ない' do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery is not a number')
      end
      it 'delivery_idが0の場合登録出来ない' do
        @item.delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery must be other than 0')
      end
      it 'priceが空の場合登録出来ない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceの値が300未満の場合登録出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceの値が9999999より大きい場合登録出来ない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが全角入力の場合登録出来ない' do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '紐付いたuserが空の場合登録出来ない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
