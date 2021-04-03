class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :delivery_day

  with_options presence: true do
    validates :image, :name, :explanation
    validates :price, format: { with: /\A[0-9]\d+\z/, message: 'Half-width number' }
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'

  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :condition_id, numericality: { other_than: 1, message: 'Select' }
  validates :postage_id, numericality: { other_than: 1, message: 'Select' }
  validates :area_id, numericality: { other_than: 1, message: 'Select' }
  validates :delivery_day_id, numericality: { other_than: 1, message: 'Select' }
end
