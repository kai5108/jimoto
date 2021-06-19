crumb :root do
  link "Home", root_path
end

crumb :user_login do
  link "Login", new_user_session_path
  parent :root
end

crumb :user_signin do
  link "Signin", new_user_registration_path
  parent :root
end

crumb :user_show do
  link "User", user_path
  parent :root
end

crumb :user_edit do
  link "User edit", edit_user_path(current_user)
  parent :user_show
end

crumb :place do
  link "Place", places_path
  parent :root
end

crumb :place_new do
  link "Place new", new_place_path
  parent :root
end

crumb :place_show do
  link "Place show", place_path
  parent :place
end

crumb :place_edit do
  link "Place edit", edit_place_path
  parent :place_show
end

crumb :search do
  link "Search", searches_search_path
  parent :place
end

crumb :chat do
  link "Chat", chats_path
  parent :root
end

crumb :chat_show do
  link "Chat show", chat_path
  parent :chat
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).