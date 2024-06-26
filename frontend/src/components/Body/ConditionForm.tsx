import { Button, Flex, FormLabel, Input, Text } from '@chakra-ui/react'
import Loading from 'components/Loading'
import useConditionFields from 'hooks/useConditionFields'
import { Dispatch, SetStateAction, useEffect, useState } from 'react'
import Select from 'react-select'
import { useLocation, useNavigate } from 'react-router-dom'
import makeSearchParams from 'utils/makeSearchParams'
import ConditionField from 'types/conditionField'

type Props = {
	isFormDirty: boolean
	name: string
	setIsFormDirty: Dispatch<SetStateAction<boolean>>
}

const ConditionForm = ({ isFormDirty, name, setIsFormDirty }: Props) => {
	const navigate = useNavigate()
	const { conditionFields, isLoading } = useConditionFields({ name })
	const query = useLocation().search
	const [formValues, setFormValues] = useState<{ [key: string]: string }>({})

	const [isSelectInputValid, setIsSelectInputValid] = useState<boolean>(false)
	const defaultInputValue = 'false'

	// Update form values with initial query params and when switching between statutes
	useEffect(() => {
		if (!isLoading && conditionFields) {
			const initialFormValues: { [key: string]: string } = {}
			setIsSelectInputValid(false)

			conditionFields.forEach((field) => {
				const queryValue = new URLSearchParams(query).get(field.input_name)
				initialFormValues[field.input_name] = queryValue || defaultInputValue

				// Set isSelectInputValid to true if a value is in the url params and the input is a dropdown
				if (
					field.input_type === 'dropdown' &&
					queryValue &&
					queryValue !== defaultInputValue
				) {
					setIsSelectInputValid(true)
				}
			})

			const fieldWithDropdowInput = conditionFields.find(
				(field) => field.input_type === 'dropdown'
			)

			// Set isSelectInputValid to true if there are no fields with dropdown inputs. If there are no inputs then the
			// input is unable to be invalid
			// this could potentially be pulled into an extraneous function checkForDropdownInput
			// but for now it fixes the bug, I think just split it into two PRS
			if (!fieldWithDropdowInput) {
				setIsSelectInputValid(true)
			}

			setFormValues(initialFormValues)
			setIsFormDirty(false)
		}
	}, [isLoading, conditionFields, query, setIsFormDirty])

	// Recursive function that determines if the conditionField should be displayed based on the status of its dependents
	const shouldDisplayField = (field: ConditionField) => {
		// Always display field if it isn't dependent on anything
		if (!field.dependent_on) {
			return true
		}

		const dependentOnValue = formValues[field.dependent_on]
		const dependentOnField = conditionFields.find(
			(f) => f.input_name === field.dependent_on
		)

		if (!dependentOnField) {
			return false
		}

		if (!shouldDisplayField(dependentOnField)) {
			return false
		}

		return dependentOnValue == field.dependent_condition
	}

	if (isLoading) {
		return <Loading />
	}

	// Grab the initial form values from the url query params
	const getOptionFromQuery = ({ field }: { field: ConditionField }) =>
		field.options
			? field.options.find(
					(option) =>
						option.value == new URLSearchParams(query).get(field.input_name)
			  )
			: null

	const handleFieldChange = (fieldName: string, value: string) => {
		setFormValues((prevFormValues) => ({
			...prevFormValues,
			[fieldName]: value,
		}))
		setIsFormDirty(true)
	}

	const handleSubmit = () => {
		const parsedFormValues: { [key: string]: string } = {}
		// When submitting we should set any form value to false if its corresponding condition field should not be
		// displayed. This essentially cleans the form values when making changes to a complex condition field form.
		conditionFields.forEach((field) => {
			if (shouldDisplayField(field)) {
				parsedFormValues[field.input_name] = formValues[field.input_name]
			} else {
				parsedFormValues[field.input_name] = 'false'
			}
		})

		const searchParams = makeSearchParams({ params: parsedFormValues })
		navigate(`/statute/${name}?${searchParams}`)
		setIsFormDirty(false)
	}

	return (
		<Flex flexDir="column" height="100%" mt="16px">
			{conditionFields.map((field) => {
				if (!shouldDisplayField(field)) {
					formValues[field.input_name] = defaultInputValue
					return null
				}

				const inputName = field.input_name
				const isQueryTrue = formValues[inputName] === 'true'
				const defaultOption = getOptionFromQuery({ field })


				return (
					<Flex alignItems={'center'} key={`input-${inputName}`} pb={8}>
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
									handleFieldChange(inputName, option.value)
									setIsSelectInputValid(true)
								}}
								options={field.options}
								name={inputName}
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
									handleFieldChange(inputName, `${event.target.checked}`)
								}}
								type={field.input_type}
							/>
						)}
					</Flex>
				)
			})}
			<Flex alignItems="flex-end" height="100%" justifyContent="center">
				{conditionFields.length ? (
					<Button
						colorScheme="teal"
						isDisabled={!isFormDirty || !isSelectInputValid}
						onClick={handleSubmit}
						height="fit-content"
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
