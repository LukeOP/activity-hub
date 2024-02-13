import { defineStore } from "pinia";
import { useSchoolStore } from "./schools";
import { useCalendarStore } from "./calendar";
import { useActionsStore } from "./actions";
import { useFilterStore } from "./filter";
import { useMenuStore } from "./menu";
import { useModalStore } from "./modal";
import { useStaffStore } from "./staff";
import { useStudentStore } from "./students";
import { useInstrumentStore } from "./instruments";
import { useEventStore } from "./events";
import { useUserStore } from "./user";


function getState(){
    return {}
}

export const useMainStore = defineStore('main', {
  state: () => (getState()),
  actions: {
    resetStores(){
      const actionsStore = useActionsStore()
        actionsStore.resetItems()

      const filterStore = useFilterStore()
        filterStore.reset()

      const menuStore = useMenuStore()
        menuStore.resetMenu()

      const calendarStore = useCalendarStore()
        calendarStore.reset()

      const eventStore = useEventStore()
        eventStore.reset()

      const schoolStore = useSchoolStore()
        schoolStore.reset()

      const modalStore = useModalStore()
        modalStore.close()

      const staffStore = useStaffStore()
        staffStore.reset()

      const studentStore = useStudentStore()
        studentStore.reset()
      
      const instrumentStore = useInstrumentStore()
        instrumentStore.reset()
      
      // const userStore = useUserStore()
      //   userStore.reset()
    },
  },
  getters: {
  }
})
