class Payment < ActiveRecord::Base
  belongs_to :order

  def successful?
    status == :complete
  end

end
