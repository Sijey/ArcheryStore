ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port  => 587,
  :domain  => 'yourdomain.com',
  :user_name => "ArcheryStoreKh@gmail.com",
  :password => "Vipower1991",
  :authentication => 'plain',
  :enable_starttls_auto => true
}