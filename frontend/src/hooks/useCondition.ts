import useGetCondition from 'queries/useGetCondition'
import { useLocation, useParams } from 'react-router-dom'
import Condition from 'types/condition'

type ReturnValue = {
	isLoading: boolean
	condition: Condition
}

const useCondition = (): ReturnValue => {
	const { statuteId } = useParams()
	const query = useLocation().search

	const { data, isLoading } = useGetCondition({ statuteId, query })

	return {
		condition: data,
		isLoading,
	}
}

export default useCondition
