type StatuteCondition = {
	[key: string]: unknown
}

type Statute = {
	conditions: StatuteCondition[]
	name: string
	url: string
}

export default Statute
