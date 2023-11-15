<template>
  <div>
    <HeaderLine heading="Settings" />
    <button class="btn btn-primary" @click="routeChange('Privacy')">Privacy Policy</button>

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