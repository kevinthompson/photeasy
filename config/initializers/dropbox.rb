Dropbox::API::Config.app_key    = ENV['DROPBOX_KEY']
Dropbox::API::Config.app_secret = ENV['DROPBOX_SECRET']
Dropbox::API::Config.mode       = 'sandbox'

class Dropbox::API::File
  def id
    ActiveSupport::Base64.encode64([path,rev].join)
  end

  def filename
    path.split('/').last
  end

  def is_photo?
    !!(mime_type =~ /image/) && (bytes >= Photo::MIN_BYTE_SIZE)
  end
end