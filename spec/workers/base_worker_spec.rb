require 'spec_helper'

describe BaseWorker do
  let(:base_worker){ BaseWorker.new }

  describe '#send_notification' do
    it 'sends a notification' do
      base_worker.send_notification
    end
  end

end