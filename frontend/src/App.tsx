import { Flex } from '@chakra-ui/react'
import { Route, Routes } from 'react-router-dom'
import Home from 'pages/Home'

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
