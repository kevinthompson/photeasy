require 'spec_helper'

describe Order do
  let(:order){ create(:order) }

  it { should belong_to(:album) }
  it { should belong_to(:share) }
  it { should belong_to(:user) }
  it { should have_many(:prints) }
  it { should have_many(:payments) }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :album_id }
  it { should validate_presence_of :prints }
end
