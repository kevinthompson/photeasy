require "spec_helper"

describe ShareMailer do
  describe '#new_share' do
    let(:user){ create(:user, name: 'Sterling Archer') }
    let(:album){ create(:album, name: 'ISIS', user: user) }
    let(:share){ create(:share, album: album, user: user, email: 'cyril@isis.org') }
    let(:mail){ ShareMailer.new_share(share_id: share.id) }

    before do
      share.generate_uuid
    end

    it 'sets the subject' do
      mail.subject.should == 'Sterling Archer has shared the "ISIS" album with you!'
    end

    it 'sets the receiver to the share email' do
      mail.to.should == [share.email]
    end

    it 'sets the sender' do
      mail.from.should == ['share@photeasy.com']
    end

    it 'displays the album name in the message' do
      mail.body.encoded.should include(album.name)
    end

    it 'displays the album creator name in the message' do
      mail.body.encoded.should include(user.name)
    end

    it 'displays the share url in the message' do
      mail.body.encoded.should include(share_url(share.uuid))
    end
  end
end
