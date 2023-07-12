import useGetConditionFields from 'queries/useGetConditionFields'
import ConditionField from 'types/conditionField'

type ReturnValue = {
	isLoading: boolean
	conditionFields: ConditionField[]
}

type Props = {
	name: string
}

const useConditionFields = ({ name }: Props): ReturnValue => {
	const { data, isLoading } = useGetConditionFields(name)

	return {
		isLoading,
		conditionFields: data,
	}
}

export default useConditionFields
