class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方を含めてください' }

  with_options presence: true do
    validates :nickname, :birth_data
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
  end

  has_many :items
  has_many :purchases
end
