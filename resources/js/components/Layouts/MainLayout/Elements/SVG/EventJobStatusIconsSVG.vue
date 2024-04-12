<template>
  <i v-if="status == 0"  class="fa-solid fa-circle-question"></i>
  <i v-else-if="status == 1" class="fa-solid fa-circle-check"></i>
  <i v-else-if="status == 2"  class="fa-solid fa-rotate fa-spin"></i>
</template>
  


<script setup>

const props = defineProps({status: Number})
</script>

<style lang="scss" scoped>
.fa-solid {
  font-size: 1.75rem;
  background-color: white;
  border-radius: 50%;
  border: 3px solid white;
}
.fa-circle-question {
  color: #bababa;
}
.fa-circle-check {
  color: #198754;
}
.fa-rotate {
  color: $ah-primary;
  background-color: transparent;
  border-color:transparent;
}
</style>