type ConditionField = {
	dependent_condition?: string
	dependent_on?: string
	input_name: string
	input_type: string
	options?: { label: string; value: string }[]
	text: string
}

export default ConditionField
