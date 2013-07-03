class DropboxProvider < BaseProvider
  attr_reader :client

  def initialize(token, secret)
    @client = ::Dropbox::API::Client.new(token: token, secret: secret)
  end

  def photos
    client.ls.select(&:is_photo?)
  end

end