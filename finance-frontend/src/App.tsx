import { useEffect, useState } from 'react'
import './App.css'

import BankStatement from './components/BankStatement'
import { fetchTransactions } from './services/transactionsApi'
import type { Transaction } from './types/transaction'

function App() {
  const [transactions, setTransactions] = useState<Transaction[]>([])
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [lastUpdated, setLastUpdated] = useState<string | null>(null)

  async function loadTransactions() {
    try {
      setLoading(true)
      setError(null)

      const data = await fetchTransactions()

      setTransactions(data)
      setLastUpdated(new Date().toISOString())
    } catch (err) {
      setError((err as Error).message)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadTransactions()
  }, [])

  return (
    <div className="app-container">
      {/* HEADER */}
      <div className="app-header">
        <h1>Finance App</h1>

        <button onClick={loadTransactions} disabled={loading}>
          {loading ? 'Atualizando...' : 'Atualizar extrato'}
        </button>
      </div>

      {/* ERRO */}
      {error && <p style={{ color: 'red' }}>{error}</p>}

      {/* EXTRATO */}
      {transactions.length > 0 && (
        <BankStatement
          transactions={transactions}
          accountId={1}
          lastUpdated={lastUpdated}
        />
      )}

      {!loading && transactions.length === 0 && !error && (
        <p>Nenhuma transação encontrada</p>
      )}
    </div>
  )
}

export default App