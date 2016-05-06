class ApplicationMailer < ActionMailer::Base
  default from: %{"Krmelín" <krmelin@tomaspavelka.cz>}
  layout "mailer"
end
