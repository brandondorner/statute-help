import useGetSentence from 'queries/useGetSentence'
import { useLocation, useParams } from 'react-router-dom'
import Sentence from 'types/sentence'

type ReturnValue = {
	isLoading: boolean
	sentence: Sentence
}

const useSentence = (): ReturnValue => {
	const { name } = useParams()
	const query = useLocation().search

	const { data, isLoading } = useGetSentence({ name, query })

	return {
		sentence: data,
		isLoading,
	}
}

export default useSentence
