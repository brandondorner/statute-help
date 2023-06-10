import { useQuery } from '@tanstack/react-query'
import axiosClient from '../network/axiosClient'
import Condition from 'types/condition'

type ReturnValue = {
	data: Condition
	isLoading: boolean
}

type Props = {
	statuteId?: string
	query: string
}

const useGetCondition = ({ statuteId, query }: Props): ReturnValue => {
	const response = useQuery({
		queryKey: ['condition', query, statuteId],
		queryFn: async () => {
			return statuteId
				? axiosClient.get(`/condition/${statuteId}/${query}`)
				: null
		},
	})

	return {
		data: response.data?.data as Condition,
		isLoading: response.isLoading,
	}
}

export default useGetCondition
