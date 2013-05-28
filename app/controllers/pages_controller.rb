class PagesController < HighVoltage::PagesController
  layout :layout_for_page

  protected

  def layout_for_page
    case request.subdomain
    when ''
      'marketing'
    else
      'application'
    end
  end
end