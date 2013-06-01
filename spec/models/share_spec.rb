require 'spec_helper'

describe Share do
  let(:share){ build(:share) }

  describe '.create' do
    it 'should assign a uuid to the share' do
      share.save
      share.uuid.should_not be_nil
    end
  end

end
