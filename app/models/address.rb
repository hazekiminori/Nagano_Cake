class Address < ApplicationRecord

  belongs_to :customer

  varidates :name, presence: true
  varidates :address, presence: true
  varidates :postal_code, presence: true

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

end
