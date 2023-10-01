<template>
  <div>
    <HeaderLine :heading="currentHire.instrument.attributes.name + ' Hire Details'" :school="currentHire.instrument.school.name" />
  </div>
</template>

<script setup>
import { useHireStore } from '/resources/js/stores/hires';
import HeaderLine from '../../../Layouts/MainLayout/Elements/HeaderLine.vue';

const hireStore = useHireStore()
const currentHire = hireStore.getHire


</script>

<style lang="scss" scoped>

</style>