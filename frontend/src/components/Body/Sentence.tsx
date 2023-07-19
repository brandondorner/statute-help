import { Flex, Heading, Text } from '@chakra-ui/react'
import parse from 'html-react-parser'
import Condition from 'types/sentence'

type Props = {
	condition: Condition
	isFormDirty: boolean
}

const Sentence = ({ condition, isFormDirty }: Props) => {
	return (
		<Flex flexDir={'column'}>
			<Heading m={4}>Sentence:</Heading>
			{condition && !isFormDirty ? (
				<Text>{parse(condition.sentence)}</Text>
			) : null}
		</Flex>
	)
}

export default Sentence
