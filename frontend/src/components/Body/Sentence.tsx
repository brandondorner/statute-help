import { Flex, Heading, Text } from '@chakra-ui/react'
import Condition from 'types/condition'

type Props = {
	condition: Condition
	isFormDirty: boolean
}

const Sentence = ({ condition, isFormDirty }: Props) => {
	return (
		<Flex flexDir={'column'}>
			<Heading m={4}>Sentence:</Heading>
			{condition && !isFormDirty ? <Text>{condition.sentence}</Text> : null}
		</Flex>
	)
}

export default Sentence
