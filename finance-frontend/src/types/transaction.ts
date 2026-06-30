export type TransactionType = 'credit' | 'debit'

export interface Transaction {
  id: number
  description: string
  amount: string
  transaction_type: TransactionType
  date: string
  account_id: number
  created_at: string
  updated_at: string
}