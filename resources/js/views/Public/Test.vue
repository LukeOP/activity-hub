<template>
  <div>
    <h1>Testing Page</h1>
    <!-- Inline <ToolTip tip="Here is a tip"><div class="btn btn-primary">Hover</div></ToolTip> Inline
    Testing... -->
    <ButtonLoading :loading="loading" buttonStyle="btn-primary" @btnClick="consoleOut">Button!!</ButtonLoading>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import ButtonLoading from '../../components/Layouts/MainLayout/Elements/Buttons/ButtonLoading.vue';

// import ToolTip from '../../components/Layouts/MainLayout/Elements/ToolTip.vue';
const loading = ref(false)

function consoleOut(){
  loading.value = true
  setTimeout(()=>{
    loading.value = false
  }, 3000)
}

</script>

<style lang="scss" scoped>

</style>