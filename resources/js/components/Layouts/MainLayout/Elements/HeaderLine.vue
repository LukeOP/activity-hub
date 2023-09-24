<template>
  <div id="header">

    <div id="above-line">
      <span id="heading">{{ heading }}</span>
      <span v-if="!mobileFormat" id="school">{{ school }}</span>
    </div>

    <!-- Dividing Line -->

    <div id="below-line" v-if="mobileFormat">
      <span id="school">{{ school }}</span>
    </div>

  </div>
</template>

<script setup>
import { useWindowSize } from '/resources/js/composables/useWindowSize';

const props = defineProps({
  heading: String,
  school: String
})

const { mobileFormat } = useWindowSize()

</script>

<style lang="scss" scoped>
#header {
  color: $ah-primary-dark;
  margin-bottom: 1.25rem;
}
#heading {
  font-size: 2.25rem;
}
#above-line {
  justify-content:space-between;
  align-items: flex-end;
  display:flex;
  border-bottom:3px solid $ah-primary;
}
@media (max-width: 768px){
  #header {
    text-align: center;
  }
  #heading {
    width: 100%;
    font-size: 1.5rem;
  }
}
</style>