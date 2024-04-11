<template>
    <div class="event-item" :class="{active: showDetails}">
        <div class="event-visible">
            <div class="event-details" @click="showDetails = !showDetails">
                <div>{{event.attributes.name}}</div>
                <div>{{event.attributes.description}}</div>
            </div>
            <i v-if="jobsOverdue()" class="fa-solid fa-triangle-exclamation fa-2x"
            :style="{color: showDetails ? 'white' : ''}" :class="{userAlert: userJobsOverdue()}"></i>
            <i class="fa-solid fa-magnifying-glass ms-2" 
            :style="{color: showDetails ? 'white' : '', borderColor: showDetails ? 'white' : ''}" @click="EventDetails"></i>
        </div>
        <div class="event-hidden" v-if="showDetails" @click="showDetails = !showDetails">
          <div v-if="user.getSchools.length > 1">{{ event.school.name }}</div>
          <div>{{event.attributes.notes}}</div>
        </div>
    </div>
</template>

<script setup>
import { useUserStore } from "/resources/js/stores/user";
import { useEventStore } from "/resources/js/stores/events"
import { ref } from "vue"
import { useRouter } from "vue-router"
import moment from "moment";
const props = defineProps({event:Object})

const router = useRouter()
const eventStore = useEventStore()
const user = useUserStore()

const showDetails = ref(false)

function jobsOverdue() {
  return props.event.jobs.some(j => (j.due_date < moment().format('YYYY-MM-DD') && j.status == 0))
}
function userJobsOverdue(event){
  if(user.hasPermission('EVENTS_E', props.event.school.id)) return true
  let overdueJobs = props.event.jobs.filter(j => (j.due_date < moment().format('YYYY-MM-DD') && j.status == 0))
  return overdueJobs.some(j => j.users.some(u => u.attributes.id == user.attributes.id))
}

function EventDetails(){
  eventStore.setEvent(props.event.id)
  router.push({
    name: 'EventDetails'
  })
}

</script>

<style lang="scss" scoped>


.event-item {
  .event-visible {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
    .fa-magnifying-glass {
      color: $ah-primary;
      padding: 5px;
      border: 1px solid $ah-primary;
      border-radius: 6px;
    }
    .event-details {
      width: 100%;
    }
    .event-icon {
        width: 45px;
    }
  }
  .event-hidden {
      padding: 10px;
  }
  &:nth-child(odd){
      background-color: $ah-primary-background;
  }
}
.active {
    background-color: $ah-primary-light !important;
    color: white;
    border-bottom: 1px solid $ah-grey;
}
.fa-triangle-exclamation {
  color: $ah-primary;
}
.userAlert{
  color: rgb(222, 14, 14);
}

</style>