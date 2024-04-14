<template>
<div v-if="eventsLoaded && Object.keys(events).length > 0">
  <h2>Lessons</h2>
  <FullCalendar :options="calendarOptions" v-if="!loading && eventsLoaded" />
</div>
</template>

<script>
import { onMounted, ref, toRef, watch } from 'vue';
import { useRouter } from 'vue-router';
import moment from 'moment';

import FullCalendar from '@fullcalendar/vue3';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';

import useApi from '../../../composables/useApi';
import { useWindowSize } from '../../../composables/useWindowSize';
import { useCalendarEventFormatter } from '../../../composables/useCalendarEventFormatter';
import { useCalendarStore } from '../../../stores/calendar';
import { useUserStore } from '../../../stores/user';
import Modal from '../../../components/Layouts/MainLayout/Elements/ComposableElements/Modal.vue';
import LessonCalendarClickVue from '../Lessons/Modals/Calendar/LessonCalendarClick.vue';
import { useModalStore } from '../../../stores/modal';
import { useLessonsStore } from '/resources/js/stores/lessons';


export default {
  components: {
    FullCalendar,
    Modal,
    LessonCalendarClickVue
  },
  props: {
    events: Object,
  },
  setup(props) {
    const currentComponent = ref(null)
    currentComponent.value = LessonCalendarClickVue
    const formatEvent = useCalendarEventFormatter()
    const user = useUserStore()
    const modal = useModalStore()
    const calendar = useCalendarStore()
    const lessonStore = useLessonsStore()
    const { mobileFormat } = useWindowSize()
    const { data: events, loading, fetchData: fetchCalendarEvents } = useApi('/calendar-events')
    const eventsLoaded = ref(false)

    // MAIN CALENDAR OPTIONS
    const calendarOptions = ref({
      plugins: [ dayGridPlugin, interactionPlugin, timeGridPlugin, listPlugin ],
      initialView: props.initialView || 'listDay',
      eventClick: handleEventClick,
      eventContent: getEventContent,
      events: [],
      headerToolbar: headerToolbar(),
      slotMinTime: '07:00:00',
      slotMaxTime: '19:00:00',
      nowIndicator: true,
      weekends: false,
    })
    // END OF CALENDAR OPTIONS
    
    // Reformats header items in Calendar based on screen size
    function headerToolbar() {
      if(mobileFormat.value){
        return { left: 'timeGridDay,listDay', right: 'today prev,next' }
      }
      return { left: 'title', right: 'timeGridDay,listDay today prev,next'
      }
    }
    
    function getEventContent(info) {
      return { html: `${info.event.title}${attendanceTaken(info)}`}
      // if (info.event.extendedProps.location) {
      //   const location = info.event.extendedProps.location;
      //   const tutor = info.event.extendedProps.tutor;
      //   return { html: `${info.event.title}${attendanceTaken(info)}<span> ${tutor}${location}</span>` };
      // } else return { html: `${info.event.title}`}
    }

    function attendanceTaken(info) {
      let attendance = info.event.extendedProps.attendance.find(a => a.date == moment(info.event.start).format('YYYY-MM-DD'))
      if(attendance){
        switch(attendance.attendance) {
          case 'present':
            return '<i class="fa-solid fa-circle-check ms-2" style="color:green"></i>'
          case 'late':
            return '<i class="fa-solid fa-circle-check ms-2" style="color:grey"></i>'
          case 'absent':
            return '<i class="fa-solid fa-circle-xmark ms-2" style="color:red"></i>'
          default:
            break
        }
      }  else {
        if(moment(info.event.start).format('YYYY-MM-DD') < moment().format('YYYY-MM-DD')){
          return '<i class="fa-solid fa-circle-question ms-2" style="color:orange"></i>'
        }
      }
      return ''
    }
    
    function handleEventClick(info) {
      if(info.event.extendedProps.reference_type === 'lesson'){
        calendar.setEventData({
          lesson_id: info.event.extendedProps.lesson.id, 
          dateTime: info.event.start,
          lesson: info.event.extendedProps.lesson})
        lessonStore.setLesson(info.event.extendedProps.lesson)
        modal.open('LessonCalendarClick')
      }
    }

    watch(toRef(calendar.data, 'calendarData'), (newData) => {
      events.value = newData;
      // console.log('newData', newData)
      calendarOptions.value.events = newData;
    }, {deep:true});

    onMounted(async () => {
      await fetchCalendarEvents();
      // console.log(events.value)
      events.value = formatEvent(events.value, user.attributes.id);
      calendarOptions.value.events = events.value;
      calendar.setData(events.value);
      eventsLoaded.value = true;
    });

    return {
      loading,
      calendarOptions,
      handleEventClick,
      eventsLoaded,
      events
    }
  }
}
</script>
