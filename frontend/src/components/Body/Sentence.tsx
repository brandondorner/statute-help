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
				<Flex flexDir={'column'}>
					<Heading as="h2" color={'red'}>
						Disclaimer: This is not legal documentation and should not be
						treated as such nor should any actions be made using this
						information.
					</Heading>
					<Text>{parse(sentence.sentence)}</Text>
				</Flex>
			) : null}
		</Flex>
	)
}

export default Sentence
