type Props = {
	params: { [key: string]: string | boolean }
}

const makeSearchParams = ({ params }: Props) => {
	const searchParams = new URLSearchParams(window.location.search)

	for (const key in params) {
		if (key) {
			searchParams.set(key, params[key] as string)
		}
	}

	return searchParams.toString()
}

export default makeSearchParams
