require 'spec_helper'

describe Share do
  let(:share){ build(:share) }

  describe '.create' do
    it 'should assign a uuid to the share' do
      share.save
      share.uuid.should_not be_nil
    end

    it 'should queue a new share email' do
      expect {
        create(:share)
      }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end
  end

end
