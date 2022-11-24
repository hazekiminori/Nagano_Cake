class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  varidates :last_name, presence: true
  varidates :last_name_kana, presence: true
  varidates :first_name, presence: true
  varidates :first_name_kana, presence: true
  varidates :email, presence: true
  varidates :postal_code, presence: true
  varidates :address, presence: true
  varidates :telephone_number, presence: true

  def full_name
    self.last_name + " " + self.first_name
  end

end
