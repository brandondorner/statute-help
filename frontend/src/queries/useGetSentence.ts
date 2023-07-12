import { useQuery } from '@tanstack/react-query'
import axiosClient from '../network/axiosClient'
import Sentence from 'types/sentence'

type ReturnValue = {
	data: Sentence
	isLoading: boolean
}

type Props = {
	name?: string
	query: string
}

const useGetSentence = ({ name, query }: Props): ReturnValue => {
	const response = useQuery({
		queryKey: ['sentence', query, name],
		queryFn: async () => {
			return name ? axiosClient.get(`/sentence/${name}/${query}`) : null
		},
	})

	return {
		data: response.data?.data as Sentence,
		isLoading: response.isLoading,
	}
}

export default useGetSentence
