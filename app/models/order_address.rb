class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :house_number, :building, :phone_number, :order_id, :user_id, :item_id, :number, :exp_month, :exp_year, :exp_year, :cvc

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true, message: "input half-width characters" }
    validates :phone_number, format: {with: /\A0[0-9]\d{8,9}\z/, message: "is too short"}
  end
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end

end