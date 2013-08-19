module Spree
  class Slide < ActiveRecord::Base

    has_attached_file :image,
      :styles=>{:thumb=> ["#{SpreeShowcase::Config.thumbnail_style}"],
                :showcase=> ["#{SpreeShowcase::Config.showcase_style}"]},
      :url => '/spree/showcase/:id/:style/:basename.:extension',
      :path => ':rails_root/public/spree/showcase/:id/:style/:basename.:extension',
      :s3_host_name => "#{Spree::Config[:s3_host_alias]}",
      :s3_protocol => "http"
    
    # Add S3 and Heroku support
    s3_options = if Spree::Config[:use_s3] == true
      {
        :storage => 's3',
        :s3_credentials => {
          :access_key_id     => Spree::Config[:s3_access_key],
          :secret_access_key => Spree::Config[:s3_secret]
        },
        :bucket => Spree::Config[:s3_bucket]
      }
    elsif (s3_config_file = Rails.root.join('config','s3.yml')).exist?
      {
        :storage => 's3',
        :s3_credentials => s3_config_file
      }
    else
      { :storage => 'filesystem' }
    end

    attachment_definitions[:image] = (attachment_definitions[:image] || {}).merge(s3_options)
    
    default_scope order(:position) # Slides should always be ordered by position specified by user.
    scope :published, where(:published=>true)
    scope :no_slides, lambda {|num| limit(num)}
    attr_accessible :name, :body, :target_url, :published, :image, :thumbnail_message
  end
end
