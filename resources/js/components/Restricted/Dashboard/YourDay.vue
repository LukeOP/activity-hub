<template>
  <div class="row">
    <div class="col col-12 col-md-6">
      <h1>Your Day</h1>
      <calendar :events="events" :headerToolbar="headerToolbar" v-if="ready" />
    </div>
  </div>
</template>

<script>
import { onMounted, ref } from 'vue'
import Calendar from '../../Calendar.vue'
import axiosClient from '../../../axios'

import { useCalendarEventFormatter } from '../../../composables/useCalendarEventFormatter'
import { useWindowSize } from '../../../composables/useWindowSize'

export default {
  components: {
    Calendar
  },
  setup(){
    const formatEvent = useCalendarEventFormatter()
    const windowSize = useWindowSize()
    const events = ref([])
    const headerToolbar = ref({
        left: 'title',
        right: 'today prev,next'
      })
    const ready = ref(false)

    
    onMounted(()=> {
      axiosClient.get('/calendar-events').then(res => {
        events.value = formatEvent(res.data.data)
        if(windowSize < 768){
        headerToolbar.value = {
          left: 'prev,next,today'
        }
      }
        ready.value = true
      })
    })

    return {
      ready,
      events,
      headerToolbar
    }
  }

}
</script>

<style>

</style>