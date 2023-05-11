import { useQuery } from '@tanstack/react-query'
import Statute from 'types/statute'
import axiosClient from '../network/axiosClient'

type ReturnValue = {
	data: Statute[]
	isLoading: boolean
}

const useGetAllStatutes = (): ReturnValue => {
	const response = useQuery({
		queryKey: ['statute'],
		queryFn: async () => axiosClient.get('/statute'),
	})

	return {
		data: response.data?.data as Statute[],
		isLoading: response.isLoading,
	}
}

export default useGetAllStatutes
