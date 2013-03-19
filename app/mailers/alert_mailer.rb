class AlertMailer < ActionMailer::Base
  default from: "from@example.com"

  def alert_match(alert, classifieds)
    @classifieds  = classifieds
    mail(:to => alert.email, :subject => "Alertas de Clasificados")
  end
end
