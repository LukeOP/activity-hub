import EditInstrument from './EditInstrument.vue'
import InstrumentCreate from './InstrumentCreate.vue'

import hireModals from '../Hires/Modals/HireModals'

const instrumentModals = {
  EditInstrument,
  InstrumentCreate,

  ...hireModals,
}

export default instrumentModals;