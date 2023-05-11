/* eslint-disable no-console */
import axios, { type AxiosError } from 'axios'

const API_URL = import.meta.env.VITE_API_URL as string

// Same with the API Keys
const axiosClient = axios.create({
	baseURL: API_URL,
	headers: {
		Accept: 'application/json',
		'Content-Type': 'application/json',
	},
})

// Handle errors
axiosClient.interceptors.response.use(
	(response) => response,
	(error: AxiosError) => {
		console.log(`Error: ${error.message}`)
		throw error
	}
)

export default axiosClient
