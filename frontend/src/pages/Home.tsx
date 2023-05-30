import { Flex } from '@chakra-ui/react'
import Header from 'components/Header/Header'
import Body from 'components/Body/Body'

const Home = () => {
	return (
		<Flex alignItems={'center'} flexDir={'column'} width={'100%'}>
			<Header />
			<Body />
		</Flex>
	)
}

export default Home
