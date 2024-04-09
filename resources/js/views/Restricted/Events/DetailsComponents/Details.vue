<template>
  <div class="row">
    <p>{{ eventStore.getEvent.attributes.description }}</p>
    <div class="col col-12 col-md-3">
      <h3>Location:</h3>
      <span>{{ eventStore.getEvent.attributes.location }}</span>
    </div>
    <div class="col col-12 col-md-3">
      <h3>Date:</h3>
      <span>{{ formatDate(eventStore.getEvent.attributes.date) }}</span>
    </div>
    <div class="col col-12 col-md-3">
      <h3>Time:</h3>
      <span>{{ moment(eventStore.getEvent.attributes.time, 'HH:mm:ss').format('h:mma') }}</span>
    </div>
    <div class="col col-12 col-md-3">
      <h3>Linked Staff:</h3>
      <AvatarStack :users="eventStore.getLinkedStaff" />
    </div>
    <div class="col col-12">
      <h3>Notes:</h3>
      <span>{{ eventStore.getEvent.attributes.notes }}</span>
    </div>
    
  </div>
</template>

<script setup>
import moment from 'moment';
import { useEventStore } from '../../../../stores/events';
import { onMounted } from 'vue';
import { useStaffStore } from '../../../../stores/staff';
import AvatarStack from '../../../../components/Layouts/MainLayout/Elements/Avatars/AvatarStack.vue';

const eventStore = useEventStore()
const staffStore = useStaffStore()

function formatDate(date){
  return moment(date).format('MMM Do, YYYY')
}

onMounted(() => {
  staffStore.fetchStaff(eventStore.getEvent.school.id)
})

</script>

<style lang="scss" scoped>
h3 {
  color: $ah-primary-dark;
  margin-right: 1rem;
  margin-bottom: 0;
}
.col {
  display: flex;
  align-items: center;
}

</style>