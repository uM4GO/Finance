class RegisterDailyBalanceService
  def initialize(account, date)
    @account = account
    @date = date
  end
	
	def call
		Transaction.create!(
			account_id: @account.id,
			description: "Saldo do dia #{@date.strftime('%d/%m/%Y')}",
			transaction_type: "I",
			amount: @account.total_saldo,
			date: @date
		)
	end
end