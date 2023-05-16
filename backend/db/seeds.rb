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
    { weight: '0 - 5 grams', sentence: '1 year' },
    { weight: '5 - 10 grams', sentence: '3 years' },
    { weight: 'More than 10 grams', sentence: '5 years' }
  ],
  name: 'Statute 2',
  url: 'http://example.com/statute2'
)

# Create condition fields for statute 2
statute2.condition_fields.create!(
  input_name: 'weight',
  input_type: 'dropdown',
  text: 'Select weight amount',
  options: ['0 - 5 grams', '5 - 10 grams', 'More than 10 grams']
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
    },
  ],
  name: 'Aggravated Assault - RS 14:37',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78478'
)

aggravated_assault_rs_14_37.condition_fields.create!(
  input_name: 'while_stealing',
  input_type: 'checkbox',
  text: "Was the offense committed upon a store's or merchant's employee while the offender is engaged in the perpetration or attempted perpetration of theft of goods",
)

# Aggravated Assault RS 14:37.4
Statute.create!(
  conditions: [
    {
      sentence: 'Shall be fined not more than ten thousand dollars or imprisoned for not more than ten years, with or without hard labor, or both.'
    }
  ],
  name: 'Aggravated Assault - RS 14:37.4',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78482'
)

# rubocop:enable Naming/VariableNumber, Layout/LineLength
