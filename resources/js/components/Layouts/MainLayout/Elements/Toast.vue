<template>
  <transition name="toast-animation">
    <div id="toast-container" v-if="toast.getActiveState">
      <div id="close-btn">
        <i @click="closeToast" class="icon" v-html="icons.xmark"></i>
      </div>
      <div id="message-content">
        <div id="message-icon"><ToastIconSVG :status="toast.data.type" /></div>
        <div>
          <div id="title">{{ toast.data.header }}</div>
          <div id="message">{{ toast.data.message }}</div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script setup>
import { icons } from '@/images/icons/icons'
import { useToastStore } from '/resources/js/stores/toast';
import ToastIconSVG from './SVG/ToastIconSVG.vue';

const toast = useToastStore()

function closeToast(){
  toast.close()
}

</script>

<style lang="scss" scoped>
.toast-animation-enter-active,
.toast-animation-leave-active {
  transform: translateX(400px);
  opacity: 0;
  transition: all 0.5s cubic-bezier(0.52, 0.02, 0.19, 1.02);
}
#toast-container {
  position: fixed;
  bottom: 20px;
  right: 10px;
  width: 400px;
  height: fit-content;
  min-height: 70px;
  max-height: 140px;
  border-radius: 0.375rem;
  background-color: white;
  border: 1px solid $ah-primary;
  box-shadow: 0px 0px 20px $ah-grey;
}
#close-btn {
  position: absolute;
  right: 10px;
  &:hover {
    cursor: pointer;
  }
}
#message-content {
  display: flex;
  padding-top: 10px;
  #message-icon {
    width: 50px;
    margin-left: 10px;
    margin-right: 10px;
  }
  #title {
    font-size: 1rem;
    font-weight: bold;
  }
  #message {
    padding-bottom: 10px;
  }
}

.icon {
  display: block;
  width: 20px;
  margin-top: 5px;
  fill: $ah-grey;
  &:hover {
    fill: $ah-primary;
  }
}

</style>