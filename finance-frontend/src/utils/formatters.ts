import type { Transaction } from '../types/transaction'

export function formatCurrency(value: string | number): string {
  const numberValue = typeof value === 'string' ? Number(value) : value

  return new Intl.NumberFormat('pt-BR', {
    style: 'currency',
    currency: 'BRL',
  }).format(numberValue)
}

export function formatDate(date: string): string {
  return new Intl.DateTimeFormat('pt-BR').format(new Date(date))
}

export function sortTransactionsByDate(transactions: Transaction[]) {
  return [...transactions].sort(
    (a, b) => new Date(a.date).getTime() - new Date(b.date).getTime()
  )
}

export interface StatementRow extends Transaction {
  credit: number
  debit: number
  balance: number
}

export function buildStatementRows(transactions: Transaction[]): StatementRow[] {
  const sorted = sortTransactionsByDate(transactions)

  let balance = 0

  return sorted.map((tx) => {
    const amount = Number(tx.amount)

    const credit = tx.transaction_type === 'credit' ? amount : 0
    const debit = tx.transaction_type === 'debit' ? amount : 0

    balance = balance + credit - debit

    return {
      ...tx,
      credit,
      debit,
      balance,
    }
  })
}