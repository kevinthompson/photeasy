require 'spec_helper'

describe Print do
  let(:print){ create(:print) }

  it { should belong_to(:order) }
  it { should belong_to(:photo) }

  it { should validate_presence_of :quantity }
  it { should validate_presence_of :size }
  it { should validate_numericality_of(:quantity) }
  it { should ensure_inclusion_of(:size).in_array(Print::VALID_SIZES) }
  it { should validate_uniqueness_of(:photo_id).scoped_to(:order_id, :size) }
  it { should validate_uniqueness_of(:size).scoped_to(:order_id, :photo_id) }
end
