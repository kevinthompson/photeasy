require 'spec_helper'

describe MailingListSubscription do

  describe '#initialize' do
    context 'when no list_id is provided' do
      it 'assigns the DEFAULT_LIST_ID' do
        subscription = MailingListSubscription.new('example@photeasy.com')
        subscription.list_id.should == MailingListSubscription::DEFAULT_LIST_ID
      end
    end
  end

  describe '#subscribe' do
    let(:subscription){ MailingListSubscription.new('example@photeasy.com') }

    context 'when the subscription is successful' do
      it 'returns status 200' do
        Gibbon.any_instance.stub(:list_subscribe).and_return('true')
        subscription.subscribe
        subscription.code.should be_nil
        subscription.errors.should be_empty
      end
    end

    context 'when the email address is already subscribed' do
      it 'returns status 204 and an error' do
        Gibbon.any_instance.stub(:list_subscribe).and_return({ 'code' => 214, 'error' => 'example@photeasy.com is already subscribed to list Photeasy Beta. <a href=\"http://photeasy.us7.list-manage.com/subscribe/send-email?u=foo&id=bar\">Click here to update your profile.</a>'})
        subscription.subscribe
        subscription.code.should == 214
        subscription.errors.should_not be_empty
        subscription.errors.any?{ |error| error.include?('is already subscribed') }.should be_true
      end
    end

  end

end