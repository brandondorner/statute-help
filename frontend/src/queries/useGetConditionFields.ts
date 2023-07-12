import { useQuery } from '@tanstack/react-query'
import axiosClient from '../network/axiosClient'
import ConditionField from 'types/conditionField'

type ReturnValue = {
	data: ConditionField[]
	isLoading: boolean
}

const useGetConditionFields = (name: string): ReturnValue => {
	const response = useQuery({
		queryKey: ['conditionFields', name],
		queryFn: async () => axiosClient.get(`/statute/${name}`),
	})

	return {
		data: response.data?.data as ConditionField[],
		isLoading: response.isLoading,
	}
}

export default useGetConditionFields
