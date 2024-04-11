<template>
    <section id="planner-group">
        <PlannerTableRowMobile v-for="(lesson, index) in lessons" :key="index" :lesson="lesson" :date="date"/>
    </section>
  </template>
  
  <script setup>
    import PlannerTableRowMobile from './PlannerTableRowMobile.vue';
    const props = defineProps({lessons: Array, date: Object})
  </script>
  
  <style lang="scss" scoped>  
  </style>