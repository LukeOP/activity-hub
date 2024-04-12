<template>
  <div style="background-color: orange;">
    <!-- Inline <ToolTip tip="Here is a tip"><div class="btn btn-primary">Hover</div></ToolTip> Inline
    Testing... -->
    <EventJobStatusIconsSVG :status="2" />
  </div>
</template>

<script setup>
import EventJobStatusIconsSVG from '../../components/Layouts/MainLayout/Elements/SVG/EventJobStatusIconsSVG.vue';
// import ToolTip from '../../components/Layouts/MainLayout/Elements/ToolTip.vue';

</script>

<style lang="scss" scoped>

</style>