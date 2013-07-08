require "spec_helper"

describe OrderMailer do
  describe '#order_complete' do
    let(:user){ create(:user, name: 'Sterling Archer') }
    let(:order){ create(:order, user: user) }
    let(:mail){ OrderMailer.order_complete(order.id) }

    it 'sets the subject' do
      mail.subject.should == 'Your order is complete'
    end

    it 'sets the receiver to the share email' do
      mail.to.should == [user.email]
    end

    it 'sets the sender' do
      mail.from.should == ['orders@photeasy.com']
    end
  end
end
