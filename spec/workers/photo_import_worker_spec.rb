require 'spec_helper'

describe PhotoImportWorker do

  describe '#perform' do
    let(:user){ create(:user) }
    let(:photo_import_worker){ PhotoImportWorker.new }

    it 'imports photos for the given user id' do
      User.any_instance.should_receive(:import_photos).once
      photo_import_worker.perform(user_id: user.id)
    end

    context 'when the user is currently importing photos' do
      it 'does not import photos' do
        user.update_attribute(:importing_photos, true)
        User.any_instance.should_not_receive(:import_photos)
        photo_import_worker.perform(user_id: user.id)
      end
    end
  end

end