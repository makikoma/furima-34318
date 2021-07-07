class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :delivery_day

  with_options presence: true do
    validates :images, :name, :explanation
    validates :price, format: { with: /\A[0-9]\d+\z/, message: 'Half-width number' }
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id, :condition_id, :postage_id, :area_id, :delivery_day_id
  end
end
