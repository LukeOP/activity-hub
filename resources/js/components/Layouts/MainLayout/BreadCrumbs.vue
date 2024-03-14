<template>
<div class="container" :class="{buffer: route.meta.breadcrumb == 'Dashboard'}">
  <div class="breadcrumbs mt-1" v-if="!mobileFormat && route.meta.breadcrumb != 'Dashboard'">
    <span v-for="(breadcrumb, index) in breadcrumbs" :key="index">
      <span v-if="index !== breadcrumbs.length -1"> / </span>
      <router-link :to="breadcrumb.to" class="link">{{ breadcrumb.label }}</router-link>
    </span>
  </div>
</div>
  
</template>

<script setup>
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import { computed } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute();

const { mobileFormat } = useWindowSize()

const breadcrumbs = computed(() => {
  const matchedRoutes = route.matched;
  const breadcrumbList = [];

  for (const matchedRoute of matchedRoutes) {
    breadcrumbList.push({
      label: matchedRoute.meta.breadcrumb,
      to: matchedRoute.path
    });
  }
  return breadcrumbList;
});
</script>

<style lang="scss" scoped>
.breadcrumbs {
  color: $ah-primary;
}
.link {
  text-decoration: none;
  color: $ah-primary;
}
.buffer {
  height: 27.05px;
}

</style>