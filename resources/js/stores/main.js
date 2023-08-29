import { defineStore } from "pinia";
import { useSchoolStore } from "./schools";
import { useCalendarStore } from "./calendar";
import { useActionsStore } from "./actions";
import { useFilterStore } from "./filter";
import { useMenuStore } from "./menu";
import { useModalStore } from "./modal";
import { useStaffStore } from "./staff";


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

      const schoolStore = useSchoolStore()
        schoolStore.reset()

      const modalStore = useModalStore()
        modalStore.close()

      const staffStore = useStaffStore()
        staffStore.reset()
    },
  },
  getters: {
  }
})
