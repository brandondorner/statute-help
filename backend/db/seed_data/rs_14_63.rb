# rubocop:disable Layout/LineLength
# frozen_string_literal: true

# CRIMINAL TRESPASS - RS 14:63

# DROPDOWN, CHECKBOX

statute = Statute.create!(
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
