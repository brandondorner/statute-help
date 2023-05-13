import { Box, Flex } from '@chakra-ui/react'
import Select from 'react-select'
import Loading from 'components/Loading'
import useAllStatutes from 'hooks/useAllStatutes'
import { useState } from 'react'
import Statute from 'types/statute'

const Body = () => {
	const [selectedStatute, setSelectedStatute] = useState<Statute | null>()
	const { statutes, isLoading } = useAllStatutes()

	if (isLoading) {
		return <Loading />
	}

	return (
		<Flex direction={'column'}>
			<Select
				// defaultValue={statutes[0]} grab this from query params later on
				isLoading={isLoading}
				isSearchable={true}
				getOptionValue={(option) => option.name}
				onChange={(value) => setSelectedStatute(value)}
				name="color"
				options={statutes}
				placeholder="Select Statute"
				styles={{
					container: (baseStyles) => ({
						...baseStyles,
						width: '40vw',
						minWidth: '300px',
					}),
					option: (baseStyles) => ({
						...baseStyles,
						color: 'black',
					}),
				}}
			/>
			{selectedStatute ? (
				<Flex>
					<Box>{selectedStatute.name}</Box>
				</Flex>
			) : null}
		</Flex>
	)
}

export default Body
