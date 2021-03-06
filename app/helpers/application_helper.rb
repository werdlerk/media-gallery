module ApplicationHelper
  MENU_ITEMS = {
    :overview => 'media#index',
    :media_upload => 'media#new'
  }

  def menu_active?(menu_item)
    MENU_ITEMS[menu_item].present? &&
      ((MENU_ITEMS[menu_item].include?('#') &&
        MENU_ITEMS[menu_item].split('#')[0] == controller_name &&
        MENU_ITEMS[menu_item].split('#')[1] == action_name) ||
       (MENU_ITEMS[menu_item] == controller_name)
      )
  end

end
