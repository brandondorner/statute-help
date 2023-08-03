# rubocop:disable Naming/VariableNumber, Layout/LineLength, Layout/CommentIndentation
# frozen_string_literal: true

require_relative 'seed_data/rs_14_37'
require_relative 'seed_data/rs_37_4'

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

# Domestic Abuse Aggravated Assault RS 14:37.7
domestic_abuse_aggravated_assault_rs_14_37_7 = Statute.create!(
  sentences: [
    {
      child_endangerment: false,
      sentence: 'Whoever commits the crime of domestic abuse aggravated assault shall be imprisoned at hard labor for not less than one year nor more than five years and fined not more than five thousand dollars.'
    },
    {
      child_endangerment: true,
      sentence: 'When the state proves, in addition to the elements of the crime as set forth in Subsection A of this Section, that a minor child thirteen years of age or younger was present at the residence or any other scene at the time of the commission of the offense, the mandatory minimum sentence imposed by the court shall be two years imprisonment at hard labor without benefit of parole, probation, or suspension of sentence.'
    }
  ],
  name: 'RS-14-37-7',
  title: 'Domestic Abuse Aggravated Assault - RS 14:37.7',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=814014'
)

domestic_abuse_aggravated_assault_rs_14_37_7.condition_fields.create!(
  input_name: 'child_endangerment',
  input_type: 'checkbox',
  text: 'Was there a minor child thirteen years of age or younger who was present at the residence or any other scene at the time of the commission of the offense?'
)

# Simple Assault RS 14:38
Statute.create!(
  sentences: [
    {
      sentence: 'Whoever commits a simple assault shall be fined not more than two hundred dollars, or imprisoned for not more than ninety days, or both.'
    }
  ],
  name: 'RS-14-38',
  title: 'Simple Assault - RS 14:38',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78491'
)

# Mingling Harmful Substances RS 14:38.1
Statute.create!(
  sentences: [
    {
      sentence: 'Whoever commits the crime of mingling harmful substances shall be imprisoned, with or without hard labor, for not more than two years or fined not more than one thousand dollars, or both.'
    }
  ],
  name: 'RS-14-38-1',
  title: 'Mingling Harmful Substances - RS 14:38.1',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78492'
)

# Negligent Arson - RS 14:52.2
negligent_arson_rs_14_52_2 = Statute.create!(
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

negligent_arson_rs_14_52_2.condition_fields.create!(
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

# CRIMINAL TRESPASS - RS 14:63

# DROPDOWN, CHECKBOX

criminal_trespass_rs_14_63 = Statute.create!(
  sentences: [
    {
      offenses: 1,
      sentence: 'For the first offense, the fine shall be not less than one hundred dollars and not more than five hundred dollars, or imprisonment for not more than thirty days, or both.',
      wildlife: false
    },
    {
      offenses: 1,
      sentence: 'For the first offense, the fine shall be not less than one hundred dollars and not more than five hundred dollars, or imprisonment for not more than thirty days, or both. <br /> <br /> In addition to the foregoing penalties, and notwithstanding any other law to the contrary, a person convicted under this Section who has killed or otherwise misappropriated any wildlife, as defined by R.S. 56:8, in the course of commission of the offense shall forfeit the misappropriated wildlife to the law enforcement authority, and shall be ordered to pay the value of the misappropriated wildlife into the Conservation Fund of the Department of Wildlife and Fisheries in accordance with R.S. 56:40.1 et seq. The value of the wildlife that was misappropriated shall be determined by the guidelines adopted by the Wildlife and Fisheries Commission pursuant to R.S. 56:40.2.',
      wildlife: true
    },
    {
      offenses: 2,
      sentence: 'For the second offense, the fine shall be not less than three hundred dollars and not more than seven hundred fifty dollars, or imprisonment for not more than ninety days, or both.',
      wildlife: false
    },
    {
      offenses: 2,
      sentence: 'For the second offense, the fine shall be not less than three hundred dollars and not more than seven hundred fifty dollars, or imprisonment for not more than ninety days, or both. <br /> <br />  In addition to the foregoing penalties, and notwithstanding any other law to the contrary, a person convicted under this Section who has killed or otherwise misappropriated any wildlife, as defined by R.S. 56:8, in the course of commission of the offense shall forfeit the misappropriated wildlife to the law enforcement authority, and shall be ordered to pay the value of the misappropriated wildlife into the Conservation Fund of the Department of Wildlife and Fisheries in accordance with R.S. 56:40.1 et seq. The value of the wildlife that was misappropriated shall be determined by the guidelines adopted by the Wildlife and Fisheries Commission pursuant to R.S. 56:40.2.',
      wildlife: true
    },
    {
      offenses: 3,
      sentence: 'For the third offense and all subsequent offenses, the fine shall be not less than five hundred dollars and not more than one thousand dollars, or imprisonment for not less than sixty days and not more than six months, or both, and forfeiture to the law enforcement authority of any property seized in connection with the violation.',
      wildlife: false
    },
    {
      offenses: 3,
      sentence: 'For the third offense and all subsequent offenses, the fine shall be not less than five hundred dollars and not more than one thousand dollars, or imprisonment for not less than sixty days and not more than six months, or both, and forfeiture to the law enforcement authority of any property seized in connection with the violation. <br /><br />  In addition to the foregoing penalties, and notwithstanding any other law to the contrary, a person convicted under this Section who has killed or otherwise misappropriated any wildlife, as defined by R.S. 56:8, in the course of commission of the offense shall forfeit the misappropriated wildlife to the law enforcement authority, and shall be ordered to pay the value of the misappropriated wildlife into the Conservation Fund of the Department of Wildlife and Fisheries in accordance with R.S. 56:40.1 et seq. The value of the wildlife that was misappropriated shall be determined by the guidelines adopted by the Wildlife and Fisheries Commission pursuant to R.S. 56:40.2.',
      wildlife: true
    }
  ],
  name: 'RS-14-63',
  title: 'CRIMINAL TRESPASS - RS 14:63',
  url: 'https://www.legis.la.gov/legis/Law.aspx?d=78584'
)

criminal_trespass_rs_14_63.condition_fields.create!(
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

# Theft - RS 14:67
rs_16_47 = Statute.create!(
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

rs_16_47.condition_fields.create!(
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

rs_16_47.condition_fields.create!(
  dependent_condition: '4',
  dependent_on: 'value',
  input_name: 'first_offense',
  input_type: 'checkbox',
  text: 'Was this the first offense?'
)

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
