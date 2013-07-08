require 'net/ftp'

module Net
 class FTP
    def mkdir_p(path)
      directories = path.split('/')
      (0...directories.length).each do |index|
        directory_path = directories[0..index].join('/')
        begin
          mkdir directory_path
        rescue Net::FTPPermError
          next
        end
      end
    end
  end
end