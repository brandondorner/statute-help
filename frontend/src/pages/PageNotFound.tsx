import { Flex, Heading, Text } from '@chakra-ui/react'
import { NavLink } from 'react-router-dom'

const PageNotFound = () => (
	<Flex
		alignItems={'center'}
		flexDirection="column"
		gap={4}
		height="80vh"
		justifyContent="center"
		width={'100%'}
	>
		<Heading m={2}>Page Not Found</Heading>
		<Text size="md" textDecoration={'underline'}>
			<NavLink title="home" to={'/'}>
				Take me home
			</NavLink>
		</Text>
	</Flex>
)

export default PageNotFound
