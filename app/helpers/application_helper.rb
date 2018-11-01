module ApplicationHelper
  FLASH_TYPES = { alert: 'warning', notice: 'info' }.freeze

  def this_year
    Time.current.year
  end

  def github_link(author_name, repository_name)
    "https://github.com/#{author_name}/#{repository_name}"
    link_to "Rails-First-App", "https://github.com/#{author_name}/#{repository_name}", target: :blank
  end

  def flash_messages
    flash.map do |type, message|
      content_tag :p, message, class: "flash #{type}"
    end.join("\n").html_safe
  end

  private

  def flash_type(type)
    "alert alert-#{FLASH_TYPES[type.to_sym]}"
  end
end
