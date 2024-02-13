<template>
  <div>
    <HeaderLine heading="Settings" />
    <div class="btn btn-primary" @click="routeChange('Privacy')">Privacy Policy</div><br>
    <div class="btn btn-primary mt-2" @click="routeChange('SchoolSetup')">School Setup</div>

  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue';

const router = useRouter()

function routeChange(route_name){
  router.push({
    name: route_name
  })
}

</script>

<style lang="scss" scoped>

</style>