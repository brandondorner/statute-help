# rubocop:disable Layout/LineLength
# frozen_string_literal: true

# Theft - RS 14:67
statute = Statute.create!(
  sentences: [
    { value: 1, sentence: 'The offender shall be imprisoned at hard labor for not more than twenty years, or may be fined not more than fifty thousand dollars, or both.' },
    { value: 2, sentence: 'The offender shall be imprisoned, with or without hard labor, for not more than ten years, or may be fined not more than ten thousand dollars, or both.' },
    { value: 3, sentence: 'The offender shall be imprisoned, with or without hard labor, for not more than five years, or may be fined not more than three thousand dollars, or both.' },
    { value: 4, sentence: 'The offender shall be imprisoned for not more than six months, or may be fined not more than one thousand dollars, or both.' },
    { first_offense: true, value: 4, sentence: 'The offender shall be imprisoned, with or without hard labor, for not more than two years, or may be fined not more than two thousand dollars, or both.' }
  ],
  name: 'RS-14-67',
  title: 'Theft - RS 14:67',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78375'
)

statute.condition_fields.create!(
  input_name: 'value',
  input_type: 'dropdown',
  text: 'What was the aggregate value of the taken or misappropriated items?',
  options: [
    { label: 'Twenty-five thousand dollars or more', value: 1 },
    { label: 'Five thousand dollars or more, but less than a value of twenty-five thousand dollars', value: 2 },
    { label: 'One thousand dollars or more, but less than a value of five thousand dollars', value: 3 },
    { label: 'Less than one thousand dollars', value: 4 }
  ]
)

statute.condition_fields.create!(
  dependent_condition: '4',
  dependent_on: 'value',
  input_name: 'first_offense',
  input_type: 'checkbox',
  text: 'Was this the first offense?'
)

# rubocop:enable Layout/LineLength
