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
  </div>
</template>

<script setup>

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