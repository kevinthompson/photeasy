class DropboxProvider < BaseProvider
  attr_reader :client

  def initialize(token, secret)
    @client = ::Dropbox::API::Client.new(token: token, secret: secret)
  end

  def photos
    files = client.ls.select{ |entry| entry['is_dir'] == false && entry['mime_type'][/image/] }
    files.map do |file|
      {
        id: file.rev,
        url: file.direct_url.url
      }
    end
  end

end