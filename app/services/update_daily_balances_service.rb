class UpdateDailyBalancesService
  def initialize(account, date)
    @account = account
    @date = date
  end

  def call
    Rails.logger.info "..........aaaaaaaaaaaaaabbbb.Saldo do dia #{@date.strftime('%d/%m/%Y')}.............................................................\n"
    Rails.logger.info "DATA: #{@date.end_of_day}\n #{@account.inspect}\n"
    @account.transactions.where(transaction_type: "I", date: @date.to_date, description: "Saldo do dia #{@date.strftime('%d/%m/%Y')}" ).each do |transaction|
      Rails.logger.info transaction.inspect
      Rails.logger.info "........................................................................\n"
      creditos = @account.transactions.creditos
        .where("date <= ?", transaction.date.end_of_day) #procura todos os créditos cuja data seja menor ou igual ao final de 02/07
        .sum(:amount) #faz a soma

      debitos = @account.transactions.debitos
        .where("date <= ?", transaction.date.end_of_day)
        .sum(:amount)

      transaction.update!(amount: creditos - debitos) #atualiza o amount
    end
  end
end