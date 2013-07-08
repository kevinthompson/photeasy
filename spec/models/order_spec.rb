require 'spec_helper'

describe Order do
  let(:order){ create(:order) }

  it { should belong_to(:album) }
  it { should belong_to(:share) }
  it { should belong_to(:user) }
  it { should have_many(:prints) }
  it { should have_many(:payments) }

  it { should validate_presence_of :album_id }
  it { should validate_presence_of :user_id }

  describe '#save' do
    context 'with prints' do
      it 'creates new prints associated to order' do
        order = build(:order)
        order.prints << build(:print, order: order)
        expect{ order.save }.to change{ Print.where(order_id: order.id).count }.from(0).to(1)
      end
    end
  end

  describe 'paid?' do
    context 'when the order has a successful payment' do
      it 'should return true' do
        create(:payment, order: order)
        order.paid?.should == true
      end
    end

    context 'when the order does not have a successful payment' do
      it 'should return true' do
        order.paid?.should == false
      end
    end
  end

  describe 'ready_to_submit?' do
    context 'when a suffessful payment and prints exist' do
      it 'should return true' do
        create(:payment, order: order)
        create(:print, order: order)
        order.ready_to_submit?.should == true
      end
    end

    context 'when prints do not exist' do
      it 'should return true' do
        order.ready_to_submit?.should == false
      end
    end
  end

  describe '#submit' do
    it 'submits the order' do
      OrderSubmission.any_instance.should_receive(:submit)
      order.submit
    end
  end
end
