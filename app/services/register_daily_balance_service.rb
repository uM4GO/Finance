class RegisterDailyBalanceService
  def initialize(account, date)
    @account = account
    @date = date
  end
	
	def call
		#se ja existir uma linha com a descrição de "Saldo do dia #{@date.strftime('%d/%m/%Y')}" atualizar, senão criar
		transaction = @account.transactions.find_by(transaction_type: "I", date: @date.beginning_of_day, description: "Saldo do dia #{@date.strftime('%d/%m/%Y')}" )
		if transaction
			transaction.update(amount: @account.total_saldo)
		else
			Transaction.create!(
				account_id: @account.id,
				description: "Saldo do dia #{@date.strftime('%d/%m/%Y')}",
					transaction_type: "I",
					amount: @account.total_saldo,
					date: @date
			)
		end
	end
end

#TODO outro serviço para atualizar os saldos dos dias