import { Flex, Heading, Text } from '@chakra-ui/react'
import parse from 'html-react-parser'
import SentenceType from 'types/sentence'

type Props = {
	sentence: SentenceType
	isFormDirty: boolean
}

const Sentence = ({ sentence, isFormDirty }: Props) => {
	return (
		<Flex flexDir={'column'}>
			<Heading m={4}>Sentence:</Heading>
			{sentence && !isFormDirty ? (
				<Text>{parse(sentence.sentence)}</Text>
			) : null}
		</Flex>
	)
}

export default Sentence
