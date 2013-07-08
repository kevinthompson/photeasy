class ShareMailer < ActionMailer::Base
  layout 'email'
  default from: 'share@photeasy.com'

  def new_share(args = {})
    args = args.with_indifferent_access
    @share = Share.find(args[:share_id])
    subject = %Q[#{@share.from} has shared the "#{@share.album.name}" album with you!]
    mail(to: @share.email, subject: subject)
  end
end
