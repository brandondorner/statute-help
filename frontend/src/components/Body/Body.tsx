import { Flex, Heading, Link } from '@chakra-ui/react'
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
				getOptionLabel={(option) => option.name}
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
				<>
					<Flex
						flexDir={'column'}
						mt={10}
						p={16}
						border={'whitesmoke solid 1px'}
						borderRadius={'8px'}
						minHeight={'50vh'}
					>
						<Heading textAlign={'center'} mb={0}>
							{selectedStatute.name}
						</Heading>
						<Link
							cursor={'pointer'}
							href={selectedStatute.url}
							isExternal
							textAlign={'center'}
						>
							{selectedStatute.url}
						</Link>
					</Flex>
				</>
			) : null}
		</Flex>
	)
}

export default Body
