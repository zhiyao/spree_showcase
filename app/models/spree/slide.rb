module Spree
  class Slide < ActiveRecord::Base

    has_attached_file :image,
      :styles=>{:thumb=> ["#{SpreeShowcase::Config.thumbnail_style}"],
                :showcase=> ["#{SpreeShowcase::Config.showcase_style}"]},
      :url => '/spree/showcase/:id/:style/:basename.:extension',
      :path => ':rails_root/public/spree/showcase/:id/:style/:basename.:extension',
      :convert_options => { :all => '-strip' }


    s3_creds =
      {
        :access_key_id => Spree::Config[:s3_access_key],
        :secret_access_key => Spree::Config[:s3_secret],
        :bucket => Spree::Config[:s3_bucket]
      }
    attachment_definitions[:image][:storage] = :s3
    attachment_definitions[:image][:s3_credentials] = s3_creds
    attachment_definitions[:image][:bucket] = Spree::Config[:s3_bucket]
    attachment_definitions[:image][:s3_protocol] = Spree::Config[:s3_protocol] unless Spree::Config[:s3_protocol].blank?
    attachment_definitions[:image][:s3_host_alias] = Spree::Config[:s3_host_alias] unless Spree::Config[:s3_host_alias].blank?


    default_scope order(:position) # Slides should always be ordered by position specified by user.
    scope :published, where(:published=>true)
    scope :no_slides, lambda {|num| limit(num)}
    attr_accessible :name, :body, :target_url, :published, :image, :thumbnail_message
  end
end
