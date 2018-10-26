module ApplicationHelper
  def this_year
    Time.current.year
  end

  def github_link(author_name, repository_name)
    "https://github.com/#{author_name}/#{repository_name}"
    link_to "Rails-First-App", "https://github.com/#{author_name}/#{repository_name}", target: :blank
  end
end
