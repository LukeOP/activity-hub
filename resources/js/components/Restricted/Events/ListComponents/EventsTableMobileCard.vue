<template>
  <div class="row" :class="{active: active}" @click="active = !active">
    <div class="col col-10">
      <p>{{event.attributes.name}}</p>
      <p>{{event.attributes.state.description}}</p>
    </div>
    <div class="col col-2">
      <i class="fa-solid fa-magnifying-glass ms-2" :class="{active: active}" @click="EventDetails"></i>
    </div>
    <p v-if="active">{{event.school.name}}</p>
    <p v-if="active">{{event.attributes.notes}}</p>
  </div>
</template>

<script setup>
import { useEventStore } from "/resources/js/stores/events"
import { ref } from "vue"
import { useRouter } from "vue-router"
const props = defineProps({event:Object})

const router = useRouter()
const eventStore = useEventStore()

const active = ref(false)

function EventDetails(){
  eventStore.setEvent(props.event)
  router.push({
    name: 'EventDetails'
  })
}

</script>

<style lang="scss" scoped>

.fa-magnifying-glass {
  color: $ah-primary;
  padding: 5px;
  border: 1px solid $ah-primary;
  border-radius: 6px;
  margin-top: 7px;
}
.row {
  padding: 10px;
}
.active {
  background-color: $ah-primary-light;
  color: lighten($ah-primary-light, 50%);
  border-bottom: 1px solid $ah-grey;
  .fa-magnifying-glass {
    border-color: lighten($ah-primary-light, 50%);
  }
}
p {
  margin: 0;
}


</style>