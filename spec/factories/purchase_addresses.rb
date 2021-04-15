FactoryBot.define do
  factory :purchase_address do
    token{"tok_abcdefgh12345678901234567890"}
    postal_code{'123-4567'}
    state_id{2}
    city{'名古屋市'}
    address{'名駅9-9'}
    building_name{'ツインタワー'}
    phone{'09012345678'}
  end
end
