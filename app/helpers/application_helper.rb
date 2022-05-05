module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'PharmacyRi2022'
    (page_title.present? ? "#{page_title} | " : '') + base_title
  end
end
