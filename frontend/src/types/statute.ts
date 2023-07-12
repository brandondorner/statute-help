type StatuteCondition = {
	[key: string]: unknown
}

type Statute = {
	conditions: StatuteCondition[]
	id: number
	name: string
	title: string
	url: string
}

export default Statute
