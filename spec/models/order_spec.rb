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
end
