import type { Transaction } from '../types/transaction'

const API_URL =
  import.meta.env.VITE_API_URL ??
  '/api/v1/accounts/1/transactions'

export async function fetchTransactions(): Promise<Transaction[]> {
  const response = await fetch(API_URL)

  if (!response.ok) {
    throw new Error(`Erro ao buscar transações: ${response.status}`)
  }

  return response.json()
}