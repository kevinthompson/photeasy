require 'net/ftp'
require 'open-uri'

class OrderSubmission
  attr_accessor :order

  def initialize(order)
    self.order = order
  end

  def submit
    ftp.login(ENV['PRINT_SERVER_FTP_LOGIN'], ENV['PRINT_SERVER_FTP_PASSWORD'])
    transfer_photos
    ftp.close
  end

  private

  def ftp
    @ftp ||= Net::FTP.new(ENV['PRINT_SERVER_DOMAIN_NAME'])
  end

  def transfer_photos
    order.prints.group_by(&:size).each do |size, prints|
      ftp.mkdir_p path([order.id, size])
      prints.each do |print|
        url = URI.parse(print.photo.thumbnail.url)
        url.host ||= 'app.photeasy.dev'
        url.scheme ||= 'http'
        upload_photo url, path(order.id, size, print.photo.filename)
      end
    end
  end

  def path(*args)
    args.unshift(ENV['PRINT_SERVER_ROOT_PATH']).join('/')
  end

  def upload_photo(url, path)
    file = Tempfile.new 'photo'
    file.binmode
    open(url.to_s){ |data| file.write data.read }
    file.rewind
    file.close
    ftp.putbinaryfile file, path
    file.unlink
  end

end