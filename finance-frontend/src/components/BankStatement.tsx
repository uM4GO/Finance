import './BankStatement.css'
import type { Transaction } from '../types/transaction'
import { buildStatementRows, formatCurrency, formatDate } from '../utils/formatters'

interface Props {
  transactions: Transaction[]
  accountId: number
  lastUpdated: string | null
}

export default function BankStatement({
  transactions,
  accountId,
  lastUpdated,
}: Props) {
  const rows = buildStatementRows(transactions)

  const total = rows.length > 0 ? rows[rows.length - 1].balance : 0

  return (
    <div className="bank-statement">
      <h2>Extrato Bancário</h2>

      <div className="header-info">
        <div>Conta ID: {accountId}</div>
        <div>
          Última atualização:{' '}
          {lastUpdated ? new Date(lastUpdated).toLocaleString('pt-BR') : '---'}
        </div>
      </div>

      {rows.length === 0 ? (
        <p>Nenhuma transação encontrada.</p>
      ) : (
        <table>
          <thead>
            <tr>
              <th>Data</th>
              <th>Histórico</th>
              <th>Crédito</th>
              <th>Débito</th>
              <th>Saldo</th>
            </tr>
          </thead>

          <tbody>
            {rows.map((tx) => (
              <tr key={tx.id}>
                <td>{formatDate(tx.date)}</td>
                <td>{tx.description}</td>

                <td className="amount credit">
                  {tx.credit ? formatCurrency(tx.credit) : '-'}
                </td>

                <td className="amount debit">
                  {tx.debit ? formatCurrency(tx.debit) : '-'}
                </td>

                <td className="amount">
                  {formatCurrency(tx.balance)}
                </td>
              </tr>
            ))}
          </tbody>

          <tfoot>
            <tr>
              <td colSpan={4}>Total</td>
              <td>{formatCurrency(total)}</td>
            </tr>
          </tfoot>
        </table>
      )}
    </div>
  )
}