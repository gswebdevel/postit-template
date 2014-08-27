class Category < ActiveRecord::Base;
  has_many :post_categories
  has_many :posts, through: :post_categories

<<<<<<< HEAD
  validates :name, presence: true, length: {minimum: 5}

=======
>>>>>>> FETCH_HEAD
end