require 'digest/md5'
require 'aws/s3'

set your AWS credentials
AWS::S3::Base.establish_connection!(
  :access_key_id     => 'XXX',
  :secret_access_key => 'XXX'
  )

#get the S3 file (object)
object = AWS::S3::S3Object.find('02185773dcb5a468df6b.pdf', 'your_bucket')
#separate the etag object, and remove the extra quotations
etag = object.about['etag'].gsub('"', '')

#get the local file
f = '/Users/matt/Desktop/02185773dcb5a468df6b.pdf'
digest = Digest::MD5.hexdigest(File.read(f))

#lets see them both
puts digest + ' vs ' + etag

#a string comparison to finish it off
if digest.eql? etag
   puts 'same file!'
else
   puts 'different files.'
end
