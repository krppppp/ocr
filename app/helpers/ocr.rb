#! /usr/bin/env ruby
require 'json'
require 'google/apis/vision_v1'
require 'mysql2'
require "active_record"


ActiveRecord::Base.establish_connection(
    adapter: "mysql2",
    database: "ocrapp_development",
    :username => "root",
    :password => "",
    )
client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "", :database => "ocrapp_development")

class Images < ActiveRecord::Base
  self.table_name = self.name.downcase
end

image = Images.last
puts image

Vision = Google::Apis::VisionV1
vision = Vision::VisionService.new
vision.key = "AIzaSyAmNCCbh5tnVrVBNIcm4S_uaW5ArEVN-5s"

# filename = ARGV[0]
 filename = image.image
request = Google::Apis::VisionV1::BatchAnnotateImagesRequest.new(
    requests: [
        {
            image: {
                content: filename
            },
            features: [
                {
                    type: "TEXT_DETECTION",
                    maxResults: 1
                }
            ]
        }
    ]
)
result = vision.annotate_image(request) do |result, err|

  unless err then
    result.responses.each do |res|
      puts res.text_annotations[0].description



      client.query('UPDATE images set string = "'+res.text_annotations[0].description+'" ORDER BY id DESC LIMIT 1');
    end
  else
    puts err
  end

end
