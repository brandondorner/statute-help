# rubocop:disable Layout/LineLength
# frozen_string_literal: true

# Negligent Arson - RS 14:52.2
statute = Statute.create!(
  sentences: [
    {
      death: true,
      sentence: 'Whoever commits the crime of negligent arson resulting in death or serious bodily injury to a human being shall be fined not more than five thousand dollars and imprisoned, with or without hard labor, for not more than five years. In addition, the offender shall be ordered to pay restitution for damages sustained.'
    },
    {
      endangerment: true,
      sentence: 'Whoever commits the crime of negligent arson where it is foreseeable that human life might be endangered shall be fined not more than three thousand dollars and imprisoned, with or without hard labor, for not more than three years. In addition, the offender shall be ordered to pay restitution for damages sustained.'
    },
    {
      endangerment: false,
      first_conviction: false,
      sentence: 'On a second and subsequent conviction, the offender shall be fined not more than two thousand dollars and imprisoned, with or without hard labor, for not more than two years. In addition, the offender shall be ordered to pay restitution for damages sustained.'
    },
    {
      endangerment: false,
      first_conviction: true,
      sentence: ' On a first conviction, the offender shall be fined not more than one thousand dollars, or imprisoned for not more than six months, or both. In addition, the offender shall be ordered to pay restitution for damages sustained.'
    }
  ],
  name: 'RS-14-52-2',
  title: 'Negligent Arson - RS 14:52.2',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=1106710'
)

statute.condition_fields.create!(
  [
    {
      input_name: 'death',
      input_type: 'checkbox',
      text: 'Did the crime of negligent arson result in death or serious bodily injury?'
    },
    {
      dependent_condition: 'false',
      dependent_on: 'death',
      input_name: 'endangerment',
      input_type: 'checkbox',
      text: 'Was the crime of negligent arson commited where it is foreseeable that human life might be endangered?'
    },
    {
      dependent_condition: 'false',
      dependent_on: 'endangerment',
      input_name: 'first_conviction',
      input_type: 'checkbox',
      text: 'Was this the first conviction of negiglent arson?'
    }
  ]
)

# rubocop:enable Layout/LineLength
