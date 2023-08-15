# rubocop:disable Layout/LineLength
# frozen_string_literal: true

sentence0_file = './db/seed_data/rs_14_37_7/sentence_0.html'
sentence1_file = './db/seed_data/rs_14_37_7/sentence_1.html'
# sentence0_content = File.read(sentence0_file).to_s

# Domestic Abuse Aggravated Assault RS 14:37.7
statute = Statute.create!(
  sentences: [
    # Sentence_0
    {
      child_endangerment: false,
      # sentence: 'Whoever commits the crime of domestic abuse aggravated assault shall be imprisoned at hard labor for not less than one year nor more than five years and fined not more than five thousand dollars.'
      sentence: File.read(sentence0_file).to_s
    },
    # Sentence_1
    {
      child_endangerment: true,
      # sentence: 'When the state proves, in addition to the elements of the crime as set forth in Subsection A of this Section, that a minor child thirteen years of age or younger was present at the residence or any other scene at the time of the commission of the offense, the mandatory minimum sentence imposed by the court shall be two years imprisonment at hard labor without benefit of parole, probation, or suspension of sentence.'
      sentence: File.read(sentence1_file).to_s
    }
  ],
  name: 'RS-14-37-7-new',
  title: 'Domestic Abuse Aggravated Assault - RS 14:37.7 - New Style',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=814014'
)

statute.condition_fields.create!(
  input_name: 'child_endangerment',
  input_type: 'checkbox',
  text: 'Was there a minor child thirteen years of age or younger who was present at the residence or any other scene at the time of the commission of the offense?'
)

# rubocop:enable Layout/LineLength
