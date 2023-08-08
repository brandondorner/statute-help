# rubocop:disable Layout/LineLength
# frozen_string_literal: true

# Institutional vandalism RS 14:225
statute = Statute.create!(
  sentences: [
    { damage: 1, sentence: 'The offender shall be fined not more than five hundred dollars, or imprisoned for not more than six months, or both.' },
    { damage: 2, sentence: 'The offender shall be fined not more than one thousand dollars, or imprisoned, with or without hard labor, for not more than two years or both.' },
    { damage: 3, sentence: 'The offender shall be fined not more than ten thousand dollars, or imprisoned, with or without hard labor, for not less than one nor more than ten years, or both.' }
  ],
  name: 'RS-14-225',
  title: 'Institutional Vandalism - RS 14:225',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78375'
)

statute.condition_fields.create!(
  input_name: 'damage',
  input_type: 'dropdown',
  text: 'Select damage amount:',
  options: [
    { label: 'Less than five hundred follars', value: 1 },
    { label: 'Between five hundred dollars and fifty thousand dollars', value: 2 },
    { label: 'More than fifty thousand dollars', value: 3 }
  ]
)

# rubocop:enable Layout/LineLength
