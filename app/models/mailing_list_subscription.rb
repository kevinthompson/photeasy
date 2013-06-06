class MailingListSubscription
  BETA_LIST_ID = '90ed66b94c'
  DEFAULT_LIST_ID = BETA_LIST_ID

  attr_accessor :email, :list_id
  attr_reader :errors, :code

  def initialize(email, list_id = nil)
    @email = email
    @list_id = DEFAULT_LIST_ID if list_id.blank?
    @errors = []
  end

  def subscribe
    response = Gibbon.new.list_subscribe(id: list_id, email_address: email)
    if response === true
      @errors = []
    else
      @code = response['code']
      @errors << response['error'] if response['error']
    end
  end

end