<template>
  <div class="filter-container">
    <nav class="filter" :class="{ 'filter-visible': filterVisible }">
      <div id="sideBar">

        <div id="header" class="pt-5 pb-2">
          <i id="close-icon" class="fa-solid fa-xmark fa-2x" @click="menu.filterActive = false"></i>
          <h1>Filter</h1>
        </div>

        <div id="filter-nav">
          <component :is="activeComponent" />
        </div>

      </div>
    </nav>
    <div class="filter-overlay" v-if="filterVisible" @click="menu.filterActive = false"></div>
  </div>
</template>

<script setup>
  import { ref, shallowRef, watch } from 'vue'
import { useFilterStore } from '../../../stores/filter'
import { useMenuStore } from '../../../stores/menu'

  import LessonsForm from './FilterForms/LessonsForm.vue'
  import AttendanceSingleForm from './FilterForms/AttendanceSingleForm.vue'
  import AttendanceReviewForm from './FilterForms/AttendanceReviewForm.vue'

  const props = defineProps({state: String})
  const emit = defineEmits(['setState'])

  const menu = useMenuStore()
  const filter = useFilterStore()
  const filterVisible = ref(false)
  const activeComponent = shallowRef(null)

  watch(() => filter.type, (newValue) => {
    if(newValue == 'LessonsForm') activeComponent.value = LessonsForm
    else if(newValue == 'AttendanceSingleForm') activeComponent.value = AttendanceSingleForm
    else if(newValue == 'AttendanceReviewForm') activeComponent.value = AttendanceReviewForm
    else activeComponent.value = null
  })

  watch(() => props.state, (newValue) => {
      if(newValue === 'nav' || newValue === 'action') menu.filterActive = false;
    })

  watch(() => filter.data, (newValue) => {
    if(newValue != null && Object.keys(newValue).length > 0) menu.filter = true
    else menu.filter = false
  })

  watch(() => menu.filterActive, (newValue) => {
    filterVisible.value = newValue
    emit('setState', 'filter ' + filterVisible.value)
  })

</script>

<style lang="scss" scoped>
/* action container styles */
#sideBar {
  display: flex;
  flex-direction: column;
  height: 100vh;
  width: 250px;
  background-color: $ah-grey-dark;

  #header {
    background-color: white;
    color: $ah-grey;
    #close-icon {
      // position: fixed;
      top: 10px;
      right: 10px;
    }
    h1 {
      padding-left: 20px;
    }
  }

  #filter-nav {
    flex-grow: 1;
    flex-shrink: 0;
    flex-basis: 100px;
    margin: 10px;
    color: #fff;
  }
}

/* action styles */
.filter {
  position: fixed;
  top: 0;
  left: -260px; /* start position */
  width: 250px;
  height: 100%;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  transition: transform 0.3s ease-out;
}

/* action visible state */
.filter-visible {
  transform: translateX(260px); /* end position */
}

/* Overlay styles */
.filter-overlay {
  display: none;
}

#close-icon {
  position: absolute;
  top: 10px;
  right: 10px;
  opacity: 0;
}

/* Styles for mobile */
@media (max-width: 768px) {
  .filter-overlay {
    display: block;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    opacity: 1;
    transition: opacity 0.3s ease-out;
    z-index: -1;
  }

  #close-icon {
    opacity: 1;
  }
}
</style>
