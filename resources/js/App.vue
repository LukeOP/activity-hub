<template>
  <router-view />
</template>

<script>

export default {
  computed: {
    pageTitle() {
      // compute the title based on some state in your component
      return `${import.meta.env.VITE_TITLE} ${this.$route.meta.title} | Activity Hub`;
    }
  },
  watch: {
    pageTitle(newTitle) {
      // update the page title whenever the pageTitle computed property changes
      document.title = newTitle;
    }
  }
};
</script>

<style>

</style>
