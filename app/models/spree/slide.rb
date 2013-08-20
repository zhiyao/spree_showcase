module Spree
  class Slide < ActiveRecord::Base

    has_attached_file :image,
                      :styles=>{:thumb=> ["#{SpreeShowcase::Config.thumbnail_style}"],
                                :showcase=> ["#{SpreeShowcase::Config.showcase_style}"]},
                      default_style: :showcase,
                      :url => '/spree/showcase/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/spree/showcase/:id/:style/:basename.:extension',
                      :convert_options => { :all => '-strip -auto-orient' }

    include Spree::Core::S3Support
    supports_s3 :image

    attachment_definitions[:image][:url] = Spree::Config[:attachment_url]

    default_scope order(:position) # Slides should always be ordered by position specified by user.
    scope :published, where(:published=>true)
    scope :no_slides, lambda {|num| limit(num)}
    attr_accessible :name, :body, :target_url, :published, :image, :thumbnail_message
  end
end
