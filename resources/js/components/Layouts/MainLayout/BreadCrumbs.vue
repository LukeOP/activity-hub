<template>
<div class="container">
  <div class="breadcrumbs mt-1">
    <span v-for="(breadcrumb, index) in breadcrumbs" :key="index">
      <span v-if="index !== breadcrumbs.length - 1"> > </span>
      <router-link :to="breadcrumb.to" class="link">{{ breadcrumb.label }}</router-link>
    </span>
  </div>
</div>
  
</template>

<script setup>
import { computed } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute();

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
  position: absolute;
  top: 38px;
  // color: $ah-grey;
  color: $ah-primary;
}
.link {
  text-decoration: none;
  color: $ah-primary;
}

</style>