<template>
  <div id="header">

    <div id="above-line" :class="{centerText: center, spaceText: !center}">
      <span id="heading">{{ heading }}</span>
      <span v-if="!mobileFormat && (!link1 && !link2)" id="school">{{ school }}</span>
      <span v-if="!mobileFormat && (link1 || link2)">
        <button v-if="link1" class="btn btn-outline-primary" @click="$emit('link1', 'link1')">{{ link1 }}</button>
        <button v-if="link2" class="btn btn-outline-primary" @click="$emit('link2', 'link2')">{{ link2 }}</button>
        <button v-if="link3" class="btn btn-outline-primary" @click="$emit('link3', 'link3')">{{ link3 }}</button>
      </span>
    </div>

    <!-- Dividing Line -->

    <div id="below-line">
      <div v-if="mobileFormat || (link1 || link2)" id="school">{{ school }}</div>
      <div id="buttons" v-if="mobileFormat && (link1 || link2)">
        <button v-if="link1" class="btn btn-outline-primary" @click="$emit('link1', 'link1')">{{ link1 }}</button>
        <button v-if="link2" class="btn btn-outline-primary" @click="$emit('link2', 'link2')">{{ link2 }}</button>
        <button v-if="link3" class="btn btn-outline-primary" @click="$emit('link3', 'link3')">{{ link3 }}</button>
      </div>
    </div>

  </div>
</template>

<script setup>
import { useWindowSize } from '/resources/js/composables/useWindowSize';

const props = defineProps({
  heading: String,
  school: String,
  link1: String,
  link2: String,
  link3: String,
  center: String,
})

const emit = defineEmits(['link1', 'link2', 'link3'])

const { mobileFormat } = useWindowSize()

</script>

<style lang="scss" scoped>
.btn {
  margin-bottom: 10px;
  border-radius: 0;
  margin-left: 0.25rem;
  min-width: 125px;
  border-radius: 0.25rem;
  // &:first-of-type {
  //   border-top-left-radius: 0.75rem;
  //   border-bottom-left-radius: 0.75rem;
  // }
  // &:last-of-type {
  //   border-top-right-radius: 0.75rem;
  //   border-bottom-right-radius: 0.75rem;
  // }
}
#header {
  color: $ah-primary-dark;
  margin-bottom: 1.25rem;
}
#heading {
  font-size: 2.25rem;
}
#above-line {
  align-items: flex-end;
  display:flex;
  border-bottom:3px solid $ah-primary;
}
.centerText {
  justify-content: center;
}
.spaceText {
  justify-content: space-between;
}

#below-line {
  justify-content:flex-end;
  align-items: flex-end;
  display:flex;
}
@media (max-width: 768px){
#school {
  display: block;
  width: 100%;
}
  #header {
    text-align: center;
  }
  #heading {
    width: 100%;
    font-size: 1.5rem;
  }
  #below-line {
    display: block;
    #buttons {
      width: 100%;
      button {
        display: block;
        width: 100%;
        border-radius: 0.375rem;
        &:first-of-type {
          margin-top: 0.5rem;
        }
      }
    }
  }
}
</style>