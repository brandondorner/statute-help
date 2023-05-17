type StatuteCondition = {
	[key: string]: unknown
}

type Statute = {
	conditions: StatuteCondition[]
	id: number
	name: string
	url: string
}

export default Statute
