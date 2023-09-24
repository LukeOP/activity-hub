<template>
  <div class="row" :class="{active: active}" @click="active = !active">
    <div class="col col-10">
      <p>{{instrument.attributes.name}}</p>
      <p>{{instrument.attributes.state.description}}</p>
    </div>
    <div class="col col-2">
      <i class="fa-solid fa-magnifying-glass ms-2" :class="{active: active}" @click="InstrumentDetails"></i>
    </div>
    <p v-if="active">{{instrument.school.name}}</p>
    <p v-if="active">{{instrument.attributes.notes}}</p>
  </div>
</template>

<script setup>
import { useInstrumentStore } from "/resources/js/stores/instruments"
import { ref } from "vue"
import { useRouter } from "vue-router"
const props = defineProps({instrument:Object})

const router = useRouter()
const instrumentStore = useInstrumentStore()

const active = ref(false)

function InstrumentDetails(){
  instrumentStore.setInstrument(props.instrument)
  router.push({
    name: 'InstrumentDetails'
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