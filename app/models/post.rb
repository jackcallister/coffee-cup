class Post < ActiveRecord::Base
  belongs_to :administrator

  validates :title, :body, :administrator, presence: true

  def author
    administrator.username
  end
end
