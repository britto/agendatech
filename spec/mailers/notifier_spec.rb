require "spec_helper"

describe Notifier do
  let(:contato) {  Contato.new :nome => "Alberto",:mensagem => "oi",:mensagem => "msg" }

  context "Enviando e-mail" do

    subject { Notifier.envia_email(contato) }
    let(:mensagem) { subject.deliver }

    it "dispara o e-mail" do
      expect { mensagem }.to change(ActionMailer::Base.deliveries, :size).by(1)
    end

    it "usa o assunto padrão" do
      mensagem.subject.should == "Contato agendatech"
    end

    it "envia o e-mail para 2 recipientes" do
      mensagem.to.should have(2).items
    end

  end
end
