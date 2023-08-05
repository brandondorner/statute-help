# rubocop:disable Naming/VariableNumber, Layout/LineLength, Layout/CommentIndentation
# frozen_string_literal: true

require_relative 'seed_data/rs_14_37'
require_relative 'seed_data/rs_14_37_4'
require_relative 'seed_data/rs_14_37_7'
require_relative 'seed_data/rs_14_38'
require_relative 'seed_data/rs_14_38_1'
require_relative 'seed_data/rs_14_52_2'
require_relative 'seed_data/rs_14_63'
require_relative 'seed_data/rs_14_67'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create statutes
statute1 = Statute.create!(
  sentences: [
    { repeat: true, sentence: '12 years and $5,000 fine' },
    { repeat: false, sentence: '5 years and $1,000 fine' }
  ],
  name: 'statute-1',
  title: 'Example Statute', url: 'http://example.com/statute'
)

# Create condition fields for statute 1
statute1.condition_fields.create!(
  input_name: 'repeat',
  input_type: 'checkbox',
  text: 'Is this a repeat offense?'
)

statute2 = Statute.create!(
  sentences: [
    { weight: 1, sentence: '1 year' },
    { weight: 2, sentence: '3 years' },
    { weight: 3, sentence: '5 years' }
  ],
  name: 'statute-2',
  title: 'Statute 2',
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
  sentences: [
    { felon: false, repeat: false, sentence: '1 year and $5,000 fine' },
    { felon: false, repeat: true, sentence: '5 years and $5,000 fine' },
    { felon: true, repeat: false, sentence: '12 years and $5,000 fine' },
    { felon: true, repeat: true, sentence: '20 years and $10,000 fine' }
  ],
  name: 'statute-3',
  title: 'Statute 3', url: 'http://example.com/statute'
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

# Institutional vandalism RS 14:225
rs_14_225 = Statute.create!(
  sentences: [
    { damage: 1, sentence: 'The offender shall be fined not more than five hundred dollars, or imprisoned for not more than six months, or both.' },
    { damage: 2, sentence: 'The offender shall be fined not more than one thousand dollars, or imprisoned, with or without hard labor, for not more than two years or both.' },
    { damage: 3, sentence: 'The offender shall be fined not more than ten thousand dollars, or imprisoned, with or without hard labor, for not less than one nor more than ten years, or both.' }
  ],
  name: 'RS-14-225',
  title: 'Institutional Vandalism - RS 14:225',
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

# # Penalty for distribution or possession with intent to distribute narcotic drugs listed in Schedule I; possession of marijuana, synthetic cannabinoids, and heroin - RS 40:966
rs_40_966 = Statute.create!(
  sentences: [
  # Intent sentences
    # Marijuana
    {
      intent_marijuana_weight: 1,
      intent_substance_classification: 1,
      intent_to_distribute: true,
      sentence: 'The offender shall be imprisoned, with or without hard labor, for not less than one year nor more than ten years, and pay a fine of not more than fifty thousand dollars.'
    },
    {
      intent_marijuana_weight: 2,
      intent_substance_classification: 1,
      intent_to_distribute: true,
      sentence: 'The offender shall be imprisoned at hard labor for not less than one year nor more than twenty years and pay a fine of not more than fifty thousand dollars.'
    },
    # Heroin
    {
      bodliy_injury: false,
      intent_substance_classification: 2,
      intent_to_distribute: true,
      sentence: 'The offender, upon conviction for any amount, shall be imprisoned at hard labor for not less than five years nor more than forty years and may, in addition, be required to pay a fine of not more than fifty thousand dollars.'
    },
    {
      bodliy_injury: true,
      intent_substance_classification: 2,
      intent_to_distribute: true,
      sentence: 'If the offender unlawfully distributes or dispenses heroin or a mixture or substance containing a detectable amount of heroin or its analogues, which is the direct cause of serious bodily injury to the person who ingested or consumed the substance, the offense shall be classified as a crime of violence, and the offender shall be imprisoned at hard labor for not less than five years nor more than forty years. At least five years of the sentence of imprisonment shall be imposed without benefit of probation, parole, or suspension of sentence. In addition, the offender may be required to pay a fine of not more than fifty thousand dollars.'
    },
    # Other Substance
    {
      intent_other_weight: 1,
      intent_substance_classification: 3,
      intent_to_distribute: true,
      sentence: 'The offender shall be imprisoned, with or without hard labor, for not less than one year nor more than ten years and may, in addition, be required to pay a fine of not more than fifty thousand dollars.'
    },
    {
      intent_other_weight: 2,
      intent_substance_classification: 3,
      intent_to_distribute: true,
      sentence: 'The offender shall be imprisoned at hard labor for not less than one year nor more than twenty years and may, in addition, be required to pay a fine of not more than fifty thousand dollars.'
    },

    # ------------------

  # Possesion sentences
    # Marijuana
    {
      intent_to_distribute: false,
      possesion_marijuana_weight: 1,
      possesion_substance_classification: 1,
      sentence: '
      On a first conviction or any subsequent conviction, wherein the offender possesses fourteen grams or less, the offender shall be fined not more than one hundred dollars.
      <br/><br/>
      If an offender upon whom a fine has been imposed under this Subparagraph alleges indigency, or otherwise fails to pay the imposed fine, the court shall determine whether the defendant has willfully refused to pay or has made bona fide efforts to legally acquire resources to pay. If an offender has not willfully refused to pay and has made bona fide efforts to attempt to pay the fine imposed, the court shall use its discretion to alternatives, including installment payments or community service.
      '
    },
    {
      intent_to_distribute: false,
      possesion_marijuana_convictions: 1,
      possesion_marijuana_weight: 2,
      possesion_substance_classification: 1,
      # for sentence below, maybe pro feature would be to highlight the exact sentence in red but still have the rest of the sentence info
      sentence: 'On a first conviction, wherein the offender possesses more than fourteen grams, the offender shall be fined not more than five hundred dollars, imprisoned in the parish jail for not more than six months, or both.'
    },
    {
      intent_to_distribute: false,
      possesion_marijuana_convictions: 2,
      possesion_marijuana_weight: 2,
      possesion_substance_classification: 1,
      sentence: 'On a second conviction, wherein the offender possesses more than fourteen grams, the offender shall be fined not more than one thousand dollars, imprisoned in the parish jail for not more than six months, or both.'
    },
    {
      intent_to_distribute: false,
      possesion_marijuana_convictions: 3,
      possesion_marijuana_weight: 2,
      possesion_substance_classification: 1,
      sentence: '
      (i) On a third conviction, wherein the offender possesses more than fourteen grams, the offender shall be sentenced to imprisonment, with or without hard labor, for not more than two years, shall be fined not more than two thousand five hundred dollars.
      <br/><br/>
      (ii) If the court places the offender on probation, the probation shall provide for a minimum condition that he participate in a court-approved substance abuse program and perform four eight-hour days of court-approved community service activities. Any costs associated with probation shall be paid by the offender.
      '
    },
    {
      possesion_marijuana_convictions: 4,
      intent_to_distribute: false,
      possesion_marijuana_weight: 2,
      possesion_substance_classification: 1,
      sentence: '
      (i) On a fourth or subsequent conviction, wherein the offender possesses more than fourteen grams, the offender shall be sentenced to imprisonment with or without hard labor for not more than eight years, shall be fined not more than five thousand dollars, or both.
      <br/><br/>
      (ii) If the court places the offender on probation, the probation shall provide for a minimum condition that he participate in a court-approved substance abuse program and perform four eight-hour days of court-approved community service activities. Any costs associated with probation shall be paid by the offender.
      '
    },
    # Synthetic Cannabinoid
    {
      intent_to_distribute: false,
      possesion_substance_classification: 2,
      possesion_synthetic_convictions: 1,
      sentence: '
      On a first conviction, the offender shall be fined not more than five hundred dollars, imprisoned for not more than six months, or both.
      <br/><br/>
      If the court places the offender on probation, the probation shall provide for a minimum condition that he participate in a court-approved substance abuse program and perform four eight-hour days of court-approved community service activities. Any costs associated with probation shall be paid by the offender.
      '
    },
    {
      intent_to_distribute: false,
      possesion_substance_classification: 2,
      possesion_synthetic_convictions: 2,
      sentence: 'On a second conviction, the offender shall be fined not less than two hundred fifty dollars nor more than two thousand dollars, imprisoned with or without hard labor for not more than five years, or both.
      <br/><br/>
      If the court places the offender on probation, the probation shall provide for a minimum condition that he participate in a court-approved substance abuse program and perform four eight-hour days of court-approved community service activities. Any costs associated with probation shall be paid by the offender.
      '
    },
    {
      intent_to_distribute: false,
      possesion_substance_classification: 2,
      possesion_synthetic_convictions: 3,
      sentence: 'On a third or subsequent conviction, the offender shall be sentenced to imprisonment at hard labor for not more than twenty years, and may, in addition, be fined not more than five thousand dollars.
      <br/><br/>
      If the court places the offender on probation, the probation shall provide for a minimum condition that he participate in a court-approved substance abuse program and perform four eight-hour days of court-approved community service activities. Any costs associated with probation shall be paid by the offender.
      '
    },
    # Heroin
    {
      intent_to_distribute: false,
      possesion_heroin_weight: 1,
      possesion_substance_classification: 3,
      sentence: 'An aggregate weight of less than two grams, shall be sentenced to a term of imprisonment, with or without hard labor, for not less than two years nor more than four years.'
    },
    {
      intent_to_distribute: false,
      possesion_heroin_weight: 2,
      possesion_substance_classification: 3,
      sentence: 'An aggregate weight of less than two grams, shall be sentenced to a term of imprisonment, with or without hard labor, for not less than two years nor more than four years.'
    },

    # Other Substance
    {
      intent_to_distribute: false,
      possesion_heroin_weight: 1,
      possesion_substance_classification: 4,
      sentence: 'An aggregate weight of less than two grams, shall be imprisoned, with or without hard labor, for not more than two years and may, in addition, be required to pay a fine of not more than five thousand dollars.'
    },
    {
      intent_to_distribute: false,
      possesion_heroin_weight: 2,
      possesion_substance_classification: 4,
      sentence: 'An aggregate weight of two grams or more but less than twenty-eight grams, shall be imprisoned, with or without hard labor, for not less than one year nor more than ten years and may, in addition, be required to pay a fine of not more than five thousand dollars.'
    }
  ],
  name: 'RS-40-966',
  title: 'Penalty for distribution or possession with intent to distribute narcotic drugs listed in Schedule I; possession of marijuana, synthetic cannabinoids, and heroin - RS 40:966',
  url: 'https://www.legis.la.gov/legis/Law.aspx?p=y&d=98880'
)

# Intent Conditions
rs_40_966.condition_fields.create!(
  [
    {
      input_name: 'intent_to_distribute',
      input_type: 'checkbox',
      text: 'Was there intent to produce, manufacture, distribute or dispense or possess with intent to produce, manufacture, distribute, or dispense?'
    },
    {
      dependent_condition: 'true',
      dependent_on: 'intent_to_distribute',
      input_name: 'intent_substance_classification',
      input_type: 'dropdown',
      options: [
        {
          label: 'A substance classified in Schedule I which is marijuana, tetrahydrocannabinols, or chemical derivatives of tetrahydrocannabinols, or synthetic cannabinoids',
          value: '1'
        },
        {
          label: 'A substance classified in Schedule I that is the narcotic drug heroin or a mixture or substance containing a detectable amount of heroin or its analogues',
          value: '2'
        },
        {
          label: 'Other substance classified in Schedule I',
          value: '3'
        }
      ],
      text: 'Select substance classification'
    },
    # Marijuana
    {
      dependent_condition: '1',
      dependent_on: 'intent_substance_classification',
      input_name: 'intent_marijuana_weight',
      input_type: 'dropdown',
      options: [
        {
          label: 'Less than two and one half pounds',
          value: '1'
        },
        {
          label: 'Two and one half pounds or more',
          value: '2'
        }
      ],
      text: 'What was the aggregate weight of the substance?'
    },
    # Heroin
    {
      dependent_condition: '2',
      dependent_on: 'intent_substance_classification',
      input_name: 'bodliy_injury',
      input_type: 'checkbox',
      text: 'Was the substance the direct cause of serious bodily injury to the person who ingested or consumed the substance?'
    },
    # Other
    {
      dependent_condition: '3',
      dependent_on: 'intent_substance_classification',
      input_name: 'intent_other_weight',
      input_type: 'dropdown',
      options: [
        {
          label: 'Less than twenty-eight grams',
          value: '1'
        },
        {
          label: 'Twenty-eight grams or more',
          value: '2'
        }
      ],
      text: 'What was the aggregate weight of the substance?'
    }
  ]
)

# ---------

# Possesion Conditions
rs_40_966.condition_fields.create!(
  [
    {
      dependent_condition: 'false',
      dependent_on: 'intent_to_distribute',
      input_name: 'possesion_substance_classification',
      input_type: 'dropdown',
      options: [
        {
          label: 'A substance classified in Schedule I that is marijuana, tetrahydrocannabinol, or chemical derivatives thereof',
          value: '1'
        },
        {
          label: 'A substance classified in Schedule I which is a synthetic cannabinoid',
          value: '2'
        },
        {
          label: 'A substance classified in Schedule I that is the narcotic drug heroin or a mixture or substance containing a detectable amount of heroin or of its analogues',
          value: '3'
        },
        {
          label: 'Other substance classified in Schedule I',
          value: '4'
        }
      ],
      text: 'Select substance classification'
    },
    # Marijuana
    {
      dependent_condition: '1',
      dependent_on: 'possesion_substance_classification',
      input_name: 'possesion_marijuana_weight',
      input_type: 'dropdown',
      options: [
        {
          label: 'Fourteen grams or less',
          value: '1'
        },
        {
          label: 'More than fourteen grams',
          value: '2'
        }
      ],
      text: 'What was the aggregate weight of the substance?'
    },
    {
      dependent_condition: '2',
      dependent_on: 'possesion_marijuana_weight',
      input_name: 'possesion_marijuana_convictions',
      input_type: 'dropdown',
      options: [
        {
          label: 'This is the first conviction',
          value: '1'
        },
        {
          label: 'This is the second conviction',
          value: '2'
        },
        {
          label: 'This is the third conviction',
          value: '3'
        },
        {
          label: 'This is the fourth or subsequent conviction',
          value: '4'
        }
      ],
      text: 'Select the amount of convictions the offender has',
    # Synthetic Cannabinoid
    {
      dependent_condition: '2',
      dependent_on: 'possesion_substance_classification',
      input_name: 'convictions',
      input_type: 'dropdown',
      options: [
        {
          label: 'This is the first conviction',
          value: '1'
        },
        {
          label: 'This is the second conviction',
          value: '2'
        },
        {
          label: 'This is the third conviction or subsequent conviction',
          value: '3'
        }
      ],
      text: 'Select the amount of convictions the offender has',
    # Heroin
    {
      dependent_condition: '3',
      dependent_on: 'possesion_substance_classification',
      input_name: 'possesion_heroin_weight',
      input_type: 'dropdown',
      options: [
        {
          label: 'Less than two grams',
          value: '1'
        },
        {
          label: 'Two grams or more but less than twenty-eight grams, shall be sentenced to a term of imprisonment, with or without hard labor, for not less than two years nor more than ten years and may, in addition be required to pay a fine of not more than five thousand dollars.',
          value: '2'
        }
      ],
      text: 'What was the aggregate weight of the substance?'
    },
    # Other
    {
      dependent_condition: '4',
      dependent_on: 'possesion_substance_classification',
      input_name: 'possesion_other_weight',
      input_type: 'dropdown',
      options: [
        {
          label: 'Less than two grams',
          value: '1'
        },
        {
          label: 'Two grams or more but less than twenty-eight grams',
          value: '2'
        }
      ],
      text: 'What was the aggregate weight of the substance?'
    }
  ]
)
# rubocop:enable Naming/VariableNumber, Layout/LineLength
