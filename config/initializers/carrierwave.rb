CarrierWave.configure do |config|
  config.ftp_host = ENV['ftp_host']
  config.ftp_user = ENV['ftp_user']
  config.ftp_passwd = ENV['ftp_passwd']
  config.ftp_folder = "/public_html"
  config.ftp_url = ENV['ftp_url']
  config.ftp_passive = true
end

class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :ftp
  else
    storage :file
  end

  version :medium do
    process resize_to_fill: [480, 360]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
