import useGetConditionFields from 'queries/useGetConditionFields'
import ConditionField from 'types/conditionField'

type ReturnValue = {
	isLoading: boolean
	conditionFields: ConditionField[]
}

type Props = {
	id: number
}

const useConditionFields = ({ id }: Props): ReturnValue => {
	const { data, isLoading } = useGetConditionFields(id)

	return {
		isLoading,
		conditionFields: data,
	}
}

export default useConditionFields
