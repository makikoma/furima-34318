require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる時' do
      it 'image,name,explanation,priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'category_idが1でなければ出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'condition_idが1でなければ出品できる' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end
      it 'postage_idが1でなければ出品できる' do
        @item.postage_id = 2
        expect(@item).to be_valid
      end
      it 'area_idが1でなければ出品できる' do
        @item.area_id = 2
        expect(@item).to be_valid
      end
      it 'delivery_day_idが1でなければ出品できる' do
        @item.delivery_day_id = 2
        expect(@item).to be_valid
      end
      it 'priceが¥300~¥9,999,999の間であれば出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
      it 'priceは半角数字であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '出品できない時' do
      it 'imageが未選択では出品できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選んでください')
      end
      it 'condition_idが1では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選んでください')
      end
      it 'postage_idが1では出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選んでください')
      end
      it 'area_idが1では出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選んでください')
      end
      it 'delivery_day_idが1では出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選んでください')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceが¥300より低いと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は範囲内で入力してください')
      end
      it 'priceが¥9,999,999より高いと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は範囲内で入力してください')
      end
      it 'priceは全角数字では出品できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で入力してください')
      end
      it 'priceは全角文字では出品できない' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で入力してください')
      end
      it 'priceは半角英数混合では出品できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で入力してください')
      end
      it 'priceは半角英語だけでは出品できない' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で入力してください')
      end
    end
  end
end
