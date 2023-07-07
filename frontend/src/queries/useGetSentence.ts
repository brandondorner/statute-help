import { useQuery } from '@tanstack/react-query'
import axiosClient from '../network/axiosClient'
import Sentence from 'types/sentence'

type ReturnValue = {
	data: Sentence
	isLoading: boolean
}

type Props = {
	statuteId?: string
	query: string
}

const useGetSentence = ({ statuteId, query }: Props): ReturnValue => {
	const response = useQuery({
		queryKey: ['sentence', query, statuteId],
		queryFn: async () => {
			return statuteId
				? axiosClient.get(`/sentence/${statuteId}/${query}`)
				: null
		},
	})

	return {
		data: response.data?.data as Sentence,
		isLoading: response.isLoading,
	}
}

export default useGetSentence
