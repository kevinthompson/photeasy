class ShareMailer < ActionMailer::Base
  layout 'email'
  default from: 'share@photeasy.com'

  def new_share(share_id)
    @share = Share.find(share_id)
    subject = %Q[#{@share.from} has shared the "#{@share.album.name}" album with you!]
    mail(to: @share.email, subject: subject)
  end
end
