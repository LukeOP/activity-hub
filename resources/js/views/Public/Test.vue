<template>
  <div>
    <div style="width: 700px; height: fit-content; box-shadow: 0px 5px 10px lightgrey; margin: 30px auto; padding: 16px;">
      <div class="header">
        <div class="header-img skeleton"></div>
        <div class="title" data-title>
          <div class="skeleton skeleton-text"></div>
          <div class="skeleton skeleton-text"></div>
        </div>
      </div>
      <div data-body>
        <div class="skeleton skeleton-text"></div>
        <div class="skeleton skeleton-text"></div>
        <div class="skeleton skeleton-text"></div>
        <div class="skeleton skeleton-text"></div>       
      </div>
    </div>
    <div style="display: flex; justify-content: center; max-width: 300px; margin: auto;">
      <StatusIconSVG status="present" style="max-height: 50px;" />
      <StatusIconSVG status="late" style="max-height: 50px;" />
      <StatusIconSVG status="absent" style="max-height: 50px;" />
      <StatusIconSVG status="cancelled" style="max-height: 50px;" />
      <StatusIconSVG status="pending" style="max-height: 50px;" />
    </div>
  </div>
</template>

<script setup>
import StatusIconSVG from '../../components/Layouts/MainLayout/Elements/SVG/StatusIconSVG.vue';


</script>

<style lang="scss" scoped>
.header {
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
  .header-img {
    width: 50px;
    height: 50px;
    object-fit: cover;
    border-radius: 100%;
    margin-right: 1rem;
    flex-shrink: 0;
  }
  .title {
    font-weight: bold;
    font-size: 1.25rem;
    text-transform: capitalize;
    word-wrap: none;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    flex-grow: 1;
  }
}

</style>