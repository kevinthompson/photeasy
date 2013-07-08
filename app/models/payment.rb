class Payment < ActiveRecord::Base
  belongs_to :order

  def successful?
    status == 'successful'
  end

end
