class Share < ActiveRecord::Base
  attr_accessible :album_id, :disabled_at, :email, :visits
  belongs_to :album

  validates :album_id, presence: true
end
