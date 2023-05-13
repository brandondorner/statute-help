import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import './index.css'

const queryClient = new QueryClient()

// eslint-disable-next-line import/no-named-as-default-member
ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
	<React.StrictMode>
			<QueryClientProvider client={queryClient}>
				<App />
			</QueryClientProvider>
	</React.StrictMode>
)
