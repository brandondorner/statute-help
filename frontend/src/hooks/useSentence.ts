import useGetSentence from 'queries/useGetSentence'
import { useLocation, useParams } from 'react-router-dom'
import Sentence from 'types/sentence'

type ReturnValue = {
	isLoading: boolean
	condition: Sentence
}

const useSentence = (): ReturnValue => {
	const { statuteId } = useParams()
	const query = useLocation().search

	const { data, isLoading } = useGetSentence({ statuteId, query })

	return {
		condition: data,
		isLoading,
	}
}

export default useSentence