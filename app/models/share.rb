class Share < ActiveRecord::Base
  include Extensions::UUID
  attr_accessible :album_id, :disabled_at, :email, :visits

  belongs_to :album
  has_many :photos, through: :album

  validates :album_id, presence: true
end
