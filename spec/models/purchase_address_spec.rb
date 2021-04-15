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
      it 'token,postal_code,state_id,city,address,phoneが入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'postal_codeは半角数字3桁,半角ハイフン,半角数字4桁(123-4567の形)であれば購入できる' do
        @purchase_address.postal_code = '123-1234'
        expect(@purchase_address).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @purchase_address.building_name = ""
        expect(@purchase_address).to be_valid
      end
      it 'phoneは11桁以内の数値のみであれば購入できる' do
        @purchase_address.phone = '0901234123'
        expect(@purchase_address).to be_valid
      end
    end
    context '購入できない時' do
      it "tokenが空では購入できない" do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフン無しでは購入できない' do
        @purchase_address.postal_code = '1231234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeはハイフンの前後の数字が3桁,4桁(123-4567の形)以外では購入できない' do
        @purchase_address.postal_code = '12-123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeは全角ハイフン、全角数字では購入できない' do
        @purchase_address.postal_code = '１２３ー１２３４'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'state_idが1では購入できない' do
        @purchase_address.state_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("State Select")
      end
      it 'cityが空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空では購入できない' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは11桁より大きい桁では購入できない' do
        @purchase_address.phone = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone Input only number")
      end
      it 'phoneはハイフン有りでは購入できない' do
        @purchase_address.phone = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone Input only number")
      end
      it 'phoneは全角数字では購入できない' do
        @purchase_address.phone = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone Input only number")
      end
    end
  end
end

