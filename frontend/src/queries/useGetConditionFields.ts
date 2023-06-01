import { useQuery } from '@tanstack/react-query'
import axiosClient from '../network/axiosClient'
import ConditionField from 'types/conditionField'

type ReturnValue = {
	data: ConditionField[]
	isLoading: boolean
}

const useGetConditionFields = (id: number): ReturnValue => {
	const response = useQuery({
		queryKey: ['conditionFields', id],
		queryFn: async () => axiosClient.get(`/statute/${id}`),
	})

	return {
		data: response.data?.data as ConditionField[],
		isLoading: response.isLoading,
	}
}

export default useGetConditionFields
