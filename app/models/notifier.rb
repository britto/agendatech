class Notifier < ActionMailer::Base

  default :from => "contato@agendatech.com.br", :to => ["andersonlfl@gmail.com", "alots.ssa@gmail.com"]

  def envia_email(contato)
    @contato = contato
    mail(:subject => "Contato agendatech")
  end

end
