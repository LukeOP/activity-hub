<template>
  <menus />
  <div id="main-container">
    <div class="container" style="margin-top:70px">
      <ModalTemplate :modalActive="modalActive" @close="toggleModal">
        <h2 class="mb-4">What would you like to do?</h2>
        <div class="options">
            <div class="col-12 col-md-4 icon" >
              <i class="fa-solid fa-user-check fa-8x mb-3"></i>
              <input type="button" value="Mark Attendance" class="btn btn-primary form-control">
            </div>

            <div class="col-12 col-md-4 icon" >
              <i class="fa-solid fa-graduation-cap fa-8x mb-3"></i>
              <input type="button" value="View Lesson Details" class="btn btn-primary form-control">
            </div>

            <div class="col-12 col-md-4 icon" >
              <i class="fa-solid fa-pen-to-square fa-8x mb-3"></i>
              <input type="button" value="Write Lesson Notes" class="btn btn-primary form-control">
            </div>
        </div>
      </ModalTemplate>
<button @click="toggleModal">Click</button>
    </div>
  </div>
  
</template>

<script setup>
import { ref } from 'vue'
import Menus from '../Layouts/MainLayout/Menus.vue'
import ModalTemplate from '../Modal.vue'
import TestOne from '../Testing/TestOne.vue'

const modalActive = ref(false)
const toggleModal = () => {
  modalActive.value = !modalActive.value
}
</script>

<style lang="scss" scoped>
#main-container {
  position: absolute;
  width: calc(100vw - 250px);
  left: 250px;
}
h2 {
  text-align: center;
}
.options {
  display: flex;
  justify-content: space-around;
}
.icon {
  max-width: 150px;
  display: flex;
  align-items: center;
  flex-direction: column;
  &:hover{
    color: $ah-primary;
    cursor: pointer;
  }
}

.slide-fade-enter-active,
.slide-fade-leave-active {
  transition: all 0.3s ease-out;
}

.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateY(20px);
  opacity: 0;
}

/* Styles for mobile */
@media (max-width: 768px) {
  #main-container {
    width: 100%;
    left: 0px;
  }
}

</style>