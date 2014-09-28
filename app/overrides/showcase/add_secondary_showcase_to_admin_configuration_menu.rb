Deface::Override.new(
  :virtual_path => 'spree/admin/shared/_configuration_menu',
  :name => 'add_secondary_showcase_to_admin_configurations_side_menu',
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => %q{<%= configurations_sidebar_menu_item Spree.t(:secondary_showcase_slider), admin_secondary_slides_path %>}
)

