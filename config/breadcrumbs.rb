crumb :root do
  link "ホーム", root_path
end

crumb :user do
  link "ログイン", new_user_session_path
end

crumb :new_user do
  link "新規登録", new_user_registration_path
end

crumb :item_new do
  link "商品出品", new_item_path
end

crumb :item_show do |item|
  link "商品詳細", item_path(item)
  parent :root
end

crumb :item_edit do |item|
  link "商品編集"
  parent :item_show, item
end

crumb :consumer do |item|
  link "購入画面", item_consumers_path(item)
  parent :item_show, item
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).