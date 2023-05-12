# rubocop:disable Lint/UselessAssignment
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
statute2 = Statute.create!(
  conditions: [
    { weight: '0 - 5 grams', sentence: '1 year' },
    { weight: '5 - 10 grams', sentence: '3 years' },
    { weight: 'More than 10 grams', sentence: '5 years' }
  ],
  name: 'Statute 2',
  url: 'http://example.com/statute2'
)

# Create condition fields for statute 1
condition_field1 = statute1.condition_fields.create!(
  input_name: 'repeat',
  input_type: 'checkbox',
  text: 'Is this a repeat offense?'
)

# Create condition fields for statute 2
condition_field2 = statute2.condition_fields.create!(
  input_name: 'weight',
  input_type: 'dropdown',
  text: 'Select weight amount', options: ['0 - 5 grams', '5 - 10 grams', 'More than 10 grams']
)

# rubocop:enable Lint/UselessAssignment
