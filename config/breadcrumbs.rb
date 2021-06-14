crumb :root do
  link "Home", root_path
end

crumb :top do
  link "Top", new_user_session_path
  parent :root
end

# crumb :user_show do
#   link "User", user_path
#   parent :root
# end

# crumb :user_show do |user|
#   link "#{user.name} show", user_path(user)
#   parent :root
# end

# crumb :user_edit do
#   link "User edit"
#   parent :user_show
# end


# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).