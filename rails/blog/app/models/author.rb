class Author < ActiveRecord::Base
  #has_one :post
  #has_many :posts
  validates :name,      presence:     true
  validates :surrname,  presence:     true
  validates :age,       numericality: { only_integer: true, greater_than: 0 }

  has_many :author_posts
  has_many :posts, through: :author_posts, dependent: :destroy

  before_create :annotate_author

  def annotate_author
    self.author = "#{slef.author} from Binar::Apps"
  end
end