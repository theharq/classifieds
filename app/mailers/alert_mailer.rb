class AlertMailer < ActionMailer::Base
  default from: "from@example.com"

  def alert_match(alert, results)
    @results  = results
    mail(:to => alert.email, :subject => "Alertas de Clasificados")
  end
end
