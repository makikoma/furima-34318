require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '購入できる時' do
      it 'postal_code,state_id,city,address,phoneが入力されていれば購入できる' do
      end
      it 'postal_codeは半角数字3桁,半角ハイフン,半角数字4桁(123-4567の形)であれば購入できる' do
      end
      it 'building_nameは空でも購入できること' do
      end
      it 'phoneは11桁以内の数値のみであれば購入できる' do
      end
    end
    context '購入できない時' do
      it 'postal_codeが空では購入できない' do
      end
      it 'postal_codeはハイフン無しでは購入できない' do
      end
      it 'postal_codeはハイフンの前後の数字が3桁,4桁(123-4567の形)以外では購入できない' do
      end
      it 'postal_codeは全角ハイフンでは購入できない' do
      end
      it 'postal_codeは全角数字では購入できない' do
      end
      it 'state_idが1では購入できない' do
      end
      it 'cityが空では購入できない' do
      end
      it 'addressが空では購入できない' do
      end
      it 'phoneが空では購入できない' do
      end
      it 'phoneは11桁より大きい桁では購入できない' do
      end
      it 'phoneはハイフン有りでは購入できない' do
      end
      it 'phoneは全角数字では購入できない' do
      end
    end
  end
end

