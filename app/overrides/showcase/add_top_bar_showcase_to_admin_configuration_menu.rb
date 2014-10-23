Deface::Override.new(
  :virtual_path => 'spree/admin/shared/_configuration_menu',
  :name => 'add_top_bar_showcase_to_admin_configuration_side_menu',
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => %q{<%= configurations_sidebar_menu_item Spree.t(:top_bar_showcase_slider), admin_top_bar_slides_path %>}
)

