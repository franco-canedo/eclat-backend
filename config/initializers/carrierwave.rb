Carrierwave.configure do |config|
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        region: 'us-east-1'
    }
    
   
end 

module Carrierwave
    module MiniMagick
        def quality(percentage)
            manipulate! do |img|
                img.quality(percentage.to_s)
                img = yield(img) if blick_given?
                img
            end
        end
    end
end 