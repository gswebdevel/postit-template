class Post < ActiveRecord::Base;
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories


  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true

  def nice_created_at_date()
    created_at.strftime("%m.%d.%Y")
  end

  def display_created_at_date()
    nice_date(created_at)
  end

end