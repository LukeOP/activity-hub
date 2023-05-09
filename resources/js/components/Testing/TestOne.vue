<template>
  <div>
    <button @click="isExpanded = !isExpanded">Toggle</button>
    <transition name="expand">
      <div v-if="isExpanded" class="box"></div>
    </transition>
  </div>
</template>

<script>
import { ref } from 'vue';

export default {
  setup() {
    const isExpanded = ref(false);

    return {
      isExpanded
    };
  }
};
</script>

<style>
.box {
  width: 200px;
  height: 0;
  background-color: #ccc;
  transition: height 0.5s ease-in-out;
}

.expand-enter-active,
.expand-leave-active {
  transition: height 1s;
}

.expand-enter,
.expand-leave-to {
  height: 0;
}

.expand-enter-to, .expand-leave {
  height: 200px;
}
</style>
