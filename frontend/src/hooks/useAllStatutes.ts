import useGetAllStatutes from 'queries/useGetAllStatutes'
import Statute from 'types/statute'

type ReturnValue = {
	isLoading: boolean
	statutes: Statute[] | []
}

const useAllStatutes = (): ReturnValue => {
	const { data, isLoading } = useGetAllStatutes()

	return {
		isLoading,
		statutes: data || [],
	}
}

export default useAllStatutes
