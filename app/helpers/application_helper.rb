module ApplicationHelper
  include FacebookShare

  def active_menu_item(item)
    controller_name == item
  end
end

