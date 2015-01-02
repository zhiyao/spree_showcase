module Spree
  class TopBarSlide < ActiveRecord::Base

    has_attached_file :image,
                      :styles=>{:showcase=> ["#{SpreeShowcase::Config.top_bar_showcase_style}"]},
                      default_style: :showcase,
                      :url => '/spree/showcase/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/spree/showcase/:id/:style/:basename.:extension',
                      :convert_options => { :all => '-strip -auto-orient' }

    include Spree::Core::S3Support
    supports_s3 :image

    attachment_definitions[:image][:url] = Spree::Config[:attachment_url]
    attachment_definitions[:image][:path] = Spree::Config[:attachment_path]

    scope :published, where(:published=>true)
    scope :no_slides, lambda {|num| limit(num)}
    attr_accessible :name, :body, :target_url, :published, :image, :thumbnail_message
    scope :recent, -> { order(:position) }
  end
end