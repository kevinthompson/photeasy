class PagesController < HighVoltage::PagesController
  layout :layout_for_page

  protected

  def layout_for_page
    case request.subdomain
    when 'app'
      'application'
    else
      'marketing'
    end
  end
end