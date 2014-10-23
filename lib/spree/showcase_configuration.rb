class Spree::ShowcaseConfiguration < Spree::Preferences::Configuration
  preference :enabled, :boolean, :default => true
  preference :thumbnail_style, :string, :default=>"220x110#"
  preference :showcase_style, :string, :default =>"940x470#"
  preference :number_of_slides_to_show, :integer, :default=>4

  preference :slideshow, :boolean, :default => true
  preference :animation_type, :string, :default=>"fade"
  preference :slideshow_speed, :integer, :default=>3000
  preference :animation_duration, :integer, :default=>500
  preference :randomize, :boolean, :default => false
  preference :animation_loop, :boolean, :default => true
  preference :pause_on_hover, :boolean, :default => true

  preference :secondary_thumbnail_style, :string, :default=>"220x220#"
  preference :secondary_showcase_style, :string, :default=>"350x350#"

  preference :top_bar_showcase_style, :string, :default=>"310x50#"
end

