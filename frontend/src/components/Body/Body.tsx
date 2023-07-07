import { Flex, Heading, Link } from '@chakra-ui/react'
import { useNavigate, useParams } from 'react-router-dom'
import Select from 'react-select'
import Loading from 'components/Loading'
import useAllStatutes from 'hooks/useAllStatutes'
import { useEffect, useState } from 'react'
import Statute from 'types/statute'
import ConditionForm from './ConditionForm'
import useSentence from 'hooks/useSentence'
import Sentence from './Sentence'

const Body = () => {
	const [selectedStatute, setSelectedStatute] = useState<Statute | null>()
	const { statutes, isLoading } = useAllStatutes()
	const { statuteId } = useParams()
	const navigate = useNavigate()
	const { condition } = useSentence()
	const [isFormDirty, setIsFormDirty] = useState(false)

	// If there is a statuteId in the params then set the corresponding statute to selectedStatute
	// This way we have the persisted statute even on refresh or manual url navigation
	useEffect(() => {
		if (statuteId) {
			const statuteFromParams = statutes.find(
				(statute) => `${statute.id}` === statuteId
			)

			if (statuteFromParams) {
				setSelectedStatute(statuteFromParams)
			}
		}
	}, [isLoading, setSelectedStatute, statuteId])

	if (isLoading) {
		return <Loading />
	}

	return (
		<Flex direction={'column'} gap={'32px'} width={'80%'}>
			<Select
				isLoading={isLoading}
				isSearchable={true}
				value={selectedStatute}
				getOptionLabel={(option) => option.name}
				getOptionValue={(option) => option.name}
				onChange={(value) => {
					setSelectedStatute(value)
					if (value) {
						navigate(`/statute/${value.id}`)
					}
				}}
				name="statutes"
				options={statutes}
				styles={{
					container: (baseStyles) => ({
						...baseStyles,
						alignSelf: 'center',
						minWidth: '300px',
						width: '40vw',
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
							alignSelf={'center'}
							cursor={'pointer'}
							href={selectedStatute.url}
							isExternal
							textAlign={'center'}
						>
							{selectedStatute.url}
						</Link>
						<ConditionForm
							id={selectedStatute.id}
							setIsFormDirty={setIsFormDirty}
						/>
					</Flex>
					<Sentence condition={condition} isFormDirty={isFormDirty} />
				</>
			) : null}
		</Flex>
	)
}

export default Body
