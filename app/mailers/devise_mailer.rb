class DeviseMailer < Devise::Mailer
  helper :frontend
  include Devise::Controllers::UrlHelpers # e.g., `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
  default from: 'support@precise.ly'
end
