# config/initializers/carrierwave.rb
# This file is not created by default so you might have to create it yourself.
CarrierWave.configure do |config|
 config.storage    = :aws
 config.aws_bucket = 'cas-photogallery'
 config.aws_acl    = 'public-read'
 config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
 config.aws_attributes = {
   expires: 1.week.from_now.httpdate,
   cache_control: 'max-age=604800'
 }

 config.aws_credentials = {
   access_key_id:     ENV['AWS_ACCESS_KEY'],
   secret_access_key: ENV['AWS_SECRET_KEY'],
   region:            'eu-west-1'
 }
end
