# rubocop:disable Layout/LineLength
# frozen_string_literal: true

sentence0_file = './db/seed_data/rs_14_63/sentence_0.html'
sentence1_file = './db/seed_data/rs_14_63/sentence_1.html'
sentence2_file = './db/seed_data/rs_14_63/sentence_2.html'
sentence3_file = './db/seed_data/rs_14_63/sentence_3.html'
sentence4_file = './db/seed_data/rs_14_63/sentence_4.html'
sentence5_file = './db/seed_data/rs_14_63/sentence_5.html'

# CRIMINAL TRESPASS - RS 14:63

# DROPDOWN, CHECKBOX

statute = Statute.create!(
  sentences: [
    # Sentence_0
    {
      offenses: 1,
      sentence: File.read(sentence0_file).to_s,
      wildlife: false
    },
    # Sentence_1
    {
      offenses: 1,
      sentence: File.read(sentence1_file).to_s,
      wildlife: true
    },
    # Sentence_2
    {
      offenses: 2,
      sentence: File.read(sentence2_file).to_s,
      wildlife: false
    },
    # Sentence_3
    {
      offenses: 2,
      sentence: File.read(sentence3_file).to_s,
      wildlife: true
    },
    # Sentence_4
    {
      offenses: 3,
      sentence: File.read(sentence4_file).to_s,
      wildlife: false
    },
    # Sentence_5
    {
      offenses: 3,
      sentence: File.read(sentence5_file).to_s,
      wildlife: true
    }
  ],
  name: 'RS-14-63',
  title: 'CRIMINAL TRESPASS - RS 14:63',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78584'
)

statute.condition_fields.create!(
  [
    {
      input_name: 'offenses',
      input_type: 'dropdown',
      text: 'Select the number of offenses',
      options: [
        { label: 'First Offense', value: 1 },
        { label: 'Second Offense', value: 2 },
        { label: 'Third or subsequent offense', value: 3 }
      ]
    },
    {
      input_name: 'wildlife',
      input_type: 'checkbox',
      text: 'Did the person convicted under this Section kill or otherwise misappropriate any wildlife, as defined by R.S. 56:8, in the course of commission of the offense?'
    }
  ]
)

# rubocop:enable Layout/LineLength
