require 'spec_helper'

describe User do
  describe '.find_for_dropbox_oauth' do

    context 'when the user exists' do
      it 'finds a user by their auth provider and uid' do
        create(:user, provider: :dropbox, uid: 95241)
        auth = OpenStruct.new(provider: :dropbox, uid: 95241)
        user = User.find_for_dropbox_oauth(auth)
        user.should_not be_nil
      end
    end

    context 'when the user does not exist' do
      it 'creates a user using the dropbox auth credentials' do
        auth = Hashie::Mash.new(
          credentials: {
            token: 'foo',
            secret: 'bar'
          },
          extra: {
            raw_info: {
              name: 'New User'
            }
          },
          info: {
            email: 'new-user@example.org'
          },
          provider: :dropbox,
          uid: 95241
        )
        expect{ User.find_for_dropbox_oauth(auth) }.to change{ User.where(provider: :dropbox, uid: '95241').count }.from(0).to(1)
      end
    end

  end
end
