class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,
                :postal_code, :state_id, :city, :address, :building_name,
                :phone

  with_options presence: true do
    validates :user_id, :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :phone, format: { with: /\A[0-9]+\z/ }
  end
  validates :state_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, state_id: state_id, city: city, address: address,
                   building_name: building_name, phone: phone, purchase_id: purchase.id)
  end
end
