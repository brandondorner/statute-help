import { Box, Flex, Text } from '@chakra-ui/react'
import Header from './components/Header/Header'
import Body from './components/Body/Body'
import { Route, Routes } from 'react-router-dom'

const App = () => {
	return (
		<Flex
			alignItems="center"
			flexDirection={'column'}
			height={'90vh'}
			width={'100vw'}
		>
			{/* <Routes>
				<Route path="/" element={<Home />} />
			</Routes> */}
		</Flex>
	)
}

export default App
