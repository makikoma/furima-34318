class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,
                :postal_code, :state_id, :city, :address, :building_name, :phone,
                :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'を正しく入力してください' }
    validates :state_id, numericality: { other_than: 1, message: 'を選んでください' }
    validates :city, :address
    validates :phone, format: { with: /\A[0-9]{1,11}\z/, message: 'は半角数字のみ入力してください' }
    validates :user_id, :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, state_id: state_id, city: city, address: address,
                   building_name: building_name, phone: phone, purchase_id: purchase.id)
  end
end
