# rubocop:disable Layout/LineLength
# frozen_string_literal: true

# Aggravated Assault RS 14:37
statute = Statute.create!(
  sentences: [
    {
      while_stealing: false,
      sentence: 'Whoever commits an aggravated assault shall be fined not more than one thousand dollars or imprisoned for not more than six months, or both'
    },
    {
      while_stealing: true,
      sentence: 'The offender shall be imprisoned for not less than one hundred twenty days without benefit of suspension of sentence nor more than six months and may be fined not more than one thousand dollars.'
    }
  ],
  name: 'RS-14-37',
  title: 'Aggravated Assault - RS 14:37',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78478'
)

statute.condition_fields.create!(
  input_name: 'while_stealing',
  input_type: 'checkbox',
  text: "Was the offense committed upon a store's or merchant's employee while the offender is engaged in the perpetration or attempted perpetration of theft of goods?"
)

# rubocop:enable Layout/LineLength
