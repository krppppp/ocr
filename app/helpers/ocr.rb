#! /usr/bin/env ruby
require 'json'
require 'google/apis/vision_v1'
Vision = Google::Apis::VisionV1
vision = Vision::VisionService.new
vision.key = "AIzaSyAmNCCbh5tnVrVBNIcm4S_uaW5ArEVN-5s"

filename = ARGV[0]
request = Google::Apis::VisionV1::BatchAnnotateImagesRequest.new(
    requests: [
        {
            image: {
                content: File.read(filename)
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
    end
  else
    puts err
  end

end
