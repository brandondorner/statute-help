import { Button, Flex, FormLabel, Input, Text } from '@chakra-ui/react'
import Loading from 'components/Loading'
import useConditionFields from 'hooks/useConditionFields'
import { Dispatch, SetStateAction, useEffect, useState } from 'react'
import Select from 'react-select'
import { useLocation, useNavigate } from 'react-router-dom'
import makeSearchParams from 'utils/makeSearchParams'
import ConditionField from 'types/conditionField'

type Props = {
	id: number
	setIsFormDirty: Dispatch<SetStateAction<boolean>>
}

const ConditionForm = ({ id, setIsFormDirty }: Props) => {
	const navigate = useNavigate()
	const { conditionFields, isLoading } = useConditionFields({ id })
	const query = useLocation().search

	const [formValues, setFormValues] = useState<{
		[key: string]: string
	}>({})

	// Update form values with initial query params and when switching between statutes
	useEffect(() => {
		let values = {}
		if (query && conditionFields) {
			conditionFields.forEach((field) => {
				const queryValue = new URLSearchParams(query).get(field.input_name)
				if (queryValue) {
					values = { ...values, [field.input_name]: queryValue }
				}
			})
		}

		setFormValues(values)
		setIsFormDirty(false)
	}, [conditionFields])

	if (isLoading) {
		return <Loading />
	}

	const getOptionFromQuery = ({ field }: { field: ConditionField }) =>
		field.options
			? field.options.find(
					(option) =>
						option.value == new URLSearchParams(query).get(field.input_name)
			  )
			: null

	const handleSubmit = () => {
		const searchParams = makeSearchParams({ params: formValues })
		navigate(`/statute/${id}?${searchParams}`)
		setIsFormDirty(false)
	}

	return (
		<Flex flexDir={'column'} height={'100%'} mt="16px">
			{conditionFields.map((field) => {
				const inputName = field.input_name
				const isQueryTrue = formValues[inputName] === 'true'
				const defaultOption = getOptionFromQuery({ field }) || {
					label: field.text,
					value: '',
				}

				return (
					<Flex key={`input-${inputName}`}>
						<FormLabel htmlFor={inputName} pr={8}>
							{field.text}
						</FormLabel>
						{field.input_type === 'dropdown' ? (
							<Select
								defaultValue={defaultOption}
								isSearchable={true}
								onChange={(option) => {
									if (!option) {
										return
									}

									setFormValues({
										...formValues,
										[inputName]: option.value,
									})
									setIsFormDirty(true)
								}}
								options={field.options}
								name={inputName}
								placeholder={field.text}
								required
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
						) : (
							<Input
								checked={isQueryTrue}
								id={inputName}
								onChange={(event) => {
									setFormValues({
										...formValues,
										[inputName]: `${event.target.checked}`,
									})
									setIsFormDirty(true)
								}}
								type={field.input_type}
							/>
						)}
					</Flex>
				)
			})}
			<Flex alignItems={'flex-end'} height={'100%'} justifyContent={'center'}>
				{conditionFields.length ? (
					<Button
						colorScheme="teal"
						onClick={() => {
							handleSubmit()
						}}
						height={'fit-content'}
						mt={4}
						type="submit"
					>
						Update Sentence
					</Button>
				) : (
					<Text>
						There are no conditions to this statute and only one possible
						sentence.
					</Text>
				)}
			</Flex>
		</Flex>
	)
}

export default ConditionForm
