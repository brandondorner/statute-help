# rubocop:disable Naming/VariableNumber, Layout/LineLength
# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create statutes
statute1 = Statute.create!(
  conditions: [
    { repeat: true, sentence: '12 years and $5,000 fine' },
    { repeat: false, sentence: '5 years and $1,000 fine' }
  ],
  name: 'Example Statute', url: 'http://example.com/statute'
)

# Create condition fields for statute 1
statute1.condition_fields.create!(
  input_name: 'repeat',
  input_type: 'checkbox',
  text: 'Is this a repeat offense?'
)

statute2 = Statute.create!(
  conditions: [
    { weight: 1, sentence: '1 year' },
    { weight: 2, sentence: '3 years' },
    { weight: 3, sentence: '5 years' }
  ],
  name: 'Statute 2',
  url: 'http://example.com/statute2'
)

# Create condition fields for statute 2
statute2.condition_fields.create!(
  input_name: 'weight',
  input_type: 'dropdown',
  text: 'Select weight amount',
  options: [{ label: '0 - 5 grams', value: 0 }, { label: '5 - 10 grams', value: 1 }, { label: 'More than 10 grams', value: 2 }]
)

# More condition complexity
statute3 = Statute.create!(
  conditions: [
    { felon: false, repeat: false, sentence: '1 year and $5,000 fine' },
    { felon: false, repeat: true, sentence: '5 years and $5,000 fine' },
    { felon: true, repeat: false, sentence: '12 years and $5,000 fine' },
    { felon: true, repeat: true, sentence: '20 years and $10,000 fine' }
  ],
  name: 'Statute 3', url: 'http://example.com/statute'
)

# Create condition fields for statute 1
statute3.condition_fields.create!(
  [
    {
      input_name: 'repeat',
      input_type: 'checkbox',
      text: 'Is this a repeat offense?'
    },
    {
      input_name: 'felon',
      input_type: 'checkbox',
      text: 'Is the offender a felon?'
    }
  ]
)
# Real data

# Aggravated Assault RS 14:37
aggravated_assault_rs_14_37 = Statute.create!(
  conditions: [
    {
      while_stealing: false,
      sentence: 'Whoever commits an aggravated assault shall be fined not more than one thousand dollars or imprisoned for not more than six months, or both'
    },
    {
      while_stealing: true,
      sentence: 'The offender shall be imprisoned for not less than one hundred twenty days without benefit of suspension of sentence nor more than six months and may be fined not more than one thousand dollars.'
    }
  ],
  name: 'Aggravated Assault - RS 14:37',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78478'
)

aggravated_assault_rs_14_37.condition_fields.create!(
  input_name: 'while_stealing',
  input_type: 'checkbox',
  text: "Was the offense committed upon a store's or merchant's employee while the offender is engaged in the perpetration or attempted perpetration of theft of goods?"
)

# Aggravated Assault With A Firearm RS 14:37.4
Statute.create!(
  conditions: [
    {
      sentence: 'Shall be fined not more than ten thousand dollars or imprisoned for not more than ten years, with or without hard labor, or both.'
    }
  ],
  name: 'Aggravated Assault With A Firearm - RS 14:37.4',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78482'
)


# Institutional vandalism RS 14:225
rs_14_225 = Statute.create!(
  conditions: [
    { damage: 1, sentence: 'The offender shall be fined not more than five hundred dollars, or imprisoned for not more than six months, or both.' },
    { damage: 2, sentence: 'The offender shall be fined not more than one thousand dollars, or imprisoned, with or without hard labor, for not more than two years or both.' },
    { damage: 3, sentence: 'The offender shall be fined not more than ten thousand dollars, or imprisoned, with or without hard labor, for not less than one nor more than ten years, or both.' }
  ],
  name: 'Institutional Vandalism - RS 14:225',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78375'
)

rs_14_225.condition_fields.create!(
  input_name: 'damage',
  input_type: 'dropdown',
  text: 'Select damage amount:',
  options: [
    { label: 'Less than five hundred follars', value: 1 },
    { label: 'Between five hundred dollars and fifty thousand dollars', value: 2 },
    { label: 'More than fifty thousand dollars', value: 3 }
  ]
)
# rubocop:enable Naming/VariableNumber, Layout/LineLength
