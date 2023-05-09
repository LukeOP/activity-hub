<template>
  <FullCalendar :options="calendarOptions" />
</template>

<script>
import { ref } from 'vue'
import FullCalendar from '@fullcalendar/vue3'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import listPlugin from '@fullcalendar/list'
import { useRouter } from 'vue-router'

export default {
  components: {
    FullCalendar // make the <FullCalendar> tag available.
  },
  props: {
    events: Object,
    initialView: String,
    headerToolbar: Object
  },
  setup(props) {
    const router = useRouter()

    const calendarOptions = ref({
      plugins: [ dayGridPlugin, interactionPlugin, timeGridPlugin, listPlugin ],
      initialView: props.initialView || 'listDay',
      dateClick: handleDateClick,
      eventClick: handleEventClick,
      eventContent: function(info) {
        if(info.event.extendedProps.location){
          const location = info.event.extendedProps.location;
          return { html: `${info.event.title} <span class="float-end">${location}</span>` };
        } else return { html: `${info.event.title}`}
      },
      editable: true,
      events: props.events,
      headerToolbar: props.headerToolbar || {
        left: 'prev,next,today',
        center: 'title',
        right: 'timeGridWeek,timeGridDay,listDay'
      }
    })

    // console.log(props.headerToolbar)
    document.getElementsByClassName('fc-list-empty-cushion').innerHTML = "Nothing to see here..."
    

    function handleDateClick(arg) {
      alert('date click! ' + arg.dateStr)
    }

    function handleEventClick(arg) {
      if(arg.event.extendedProps.reference_type === 'lesson'){
        router.push({
          name: 'LessonDetails',
          params: {
            id: arg.event.extendedProps.reference_type_id
          }
        })
      }
      // alert('event click ' + event.event.title)
    }

    return {
      calendarOptions,
      handleDateClick,
      handleEventClick
    }
  }
}
</script>
