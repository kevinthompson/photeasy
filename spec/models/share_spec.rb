require 'spec_helper'

describe Share do
  let(:share){ build(:share) }

  it { should validate_presence_of :user_id }

  describe '.create' do
    it 'should assign a uuid to the share' do
      expect { share.save }.to change{ share.uuid }.from(nil)
    end

    it 'should queue a new share email' do
      expect { create(:share) }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end
  end

end
