<template>
  <div>
    <div id="heading" class="row">
      <div class="col col-12 col-md-8">
        <h1>{{activeComponent.heading}}</h1>
      </div>
      <div style="display:flex; justify-content: flex-end; align-items: flex-end" class="col col-12 col-md-4">
        <span class="text-primary pb-1" style="cursor:pointer" @click="handleClick(activeComponent.click)">{{activeComponent.switchText}}</span>
      </div>
    </div>

    <transition name="fade" mode="out-in">
      <component :is="activeComponent.component" />
    </transition>

  </div>
</template>

<script setup>
import { ref, shallowRef } from 'vue'
import { useRouter } from 'vue-router'
import { useFilterStore } from '../../../../stores/filter'
import AttendanceOverView from './AttendanceOverview.vue'
import AttendanceReview from './AttendanceReview.vue'

const activeComponent = shallowRef(null)
const filter = useFilterStore()

const router = useRouter()

function handleClick(value){
  filter.setType('')
  if(value === 'toReview') activeComponent.value = {component: AttendanceReview, heading: 'Attendance Review', switchText: 'Overall attendance', click: 'toOverview'}
  if(value === 'toOverview') activeComponent.value = {component: AttendanceOverView, heading: 'Attendance Overview', switchText: 'Review by dates', click: 'toReview'}
}
handleClick('toReview')
</script>

<style lang="scss" scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

</style>