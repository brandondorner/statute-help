import useGetAllStatutes from 'queries/useGetAllStatutes'
import Statute from 'types/statute'

type ReturnValue = {
	isLoading: boolean
	statutes: Statute[]
}

const useAllStatutes = (): ReturnValue => {
	const { data, isLoading } = useGetAllStatutes()

	const statuteSelectOptions = data
		? data.map((statute) => ({
				label: statute.name,
				...statute,
		  }))
		: []

	return {
		isLoading,
		statutes: statuteSelectOptions,
	}
}

export default useAllStatutes
