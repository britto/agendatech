#manguezinho para pegar funcao do mysql ou do postgree, enquanto nao rola uma decisao sobre trocar ou nao.
class SQL
  def self.mes_do_evento
    postgre? ? "date_part('month', data)" : "month(data)"
  end

  def self.ano_do_evento
    postgre? ? "date_part('year', data)" : "year(data)"
  end

  protected
  def self.postgre?
    ActiveRecord::Base.connection.adapter_name == "PostgreSQL"
  end

end
