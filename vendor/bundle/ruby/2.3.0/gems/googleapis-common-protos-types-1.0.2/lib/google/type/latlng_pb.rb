# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/type/latlng.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.type.LatLng" do
    optional :latitude, :double, 1
    optional :longitude, :double, 2
  end
end

module Google
  module Type
    LatLng = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.type.LatLng").msgclass
  end
end
