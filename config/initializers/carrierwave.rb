CarrierWave.configure do |config|
  config.ftp_host = ENV['ftp_host']
  config.ftp_user = ENV['ftp_user']
  config.ftp_passwd = ENV['ftp_passwd']
  config.ftp_folder = "/public_html"
  config.ftp_url = ENV['ftp_url']
  config.ftp_passive = true
end
