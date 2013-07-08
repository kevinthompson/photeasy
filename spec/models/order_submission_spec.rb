require 'spec_helper'

describe OrderSubmission do
  let(:order){ create(:order) }
  let(:order_submission){ OrderSubmission.new(order) }
  let(:server){ FakeFtp::Server.new(21212, 21213) }

  before do
    server.start
    ftp = Net::FTP.new
    ftp.connect('127.0.0.1', 21212)
    image_file = File.open(Rails.root.join('spec','fixtures','images','thumbnail_1.jpg'), 'rb')
    OrderSubmission.any_instance.stub(:ftp).and_return(ftp)
    OrderSubmission.any_instance.stub(:open).and_return(image_file)

    3.times do
      create(:print, order: order)
    end
  end

  after do
    server.stop
  end

  describe '#submit' do
    it 'uploads all associated photos to an ftp server' do
      order_submission.submit
      server.files.should == order.prints.map{ |print| print.photo.filename }
    end
  end

end