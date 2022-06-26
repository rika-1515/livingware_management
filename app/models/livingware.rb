class Livingware < ApplicationRecord
  has_one_attached :livingware_image
  belongs_to :group
  belongs_to :category
  validates :name, presence: true
  def get_livingware_image(width, height)
    unless livingware_image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.jpg')
      livingware_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    livingware_image.variant(resize_to_limit: [width, height]).processed
  end

  def to_buy_judge
    self.amount - self.amount_standard
  end

  def buy_amount
    self.amount_standard - self.amount
  end

  def categories_where
    category.id = 0
    categories.each do |c|
      category.id = c.category.id + 1
    end
  end

end
