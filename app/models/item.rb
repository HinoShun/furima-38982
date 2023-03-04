class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to        :user
  has_one_attached  :image
  #has_one          :order

  with_options presence: true do
    validates :image
    validates :item_name
    validates :content
  end

  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting range" }

  with_options numericality: { other_than: 0 } do
    validates :category_id, numericality: {message: "can't be blank"}
    validates :condition_id, numericality: {message: "can't be blank"}
    validates :postage_id, numericality: {message: "can't be blank"}
    validates :prefecture_id, numericality: {message: "can't be blank"}
    validates :shipping_day_id, numericality: {message: "can't be blank"}
  end

end
