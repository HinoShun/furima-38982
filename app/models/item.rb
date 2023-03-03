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

  with_options numericality: { other_than: 1 } do

  end

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  with_options presence: true do
    validates :item_name #can't be blank
    validates :content#, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "can't be blank"}
    validates :condition_id# format: {with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters"}
    validates :postage_id #, format: {with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters"}
    validates :prefecture_id
    validates :shipping_day_id
    validates :price #Input half-width characters
    validates :image #can't be blank
  end

end
