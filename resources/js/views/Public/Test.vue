<template>
  <div style="background-color: #FFFFFF; height: 100vh;">
    <div id="background" class="my-5">
      <!-- <h1>Testing Page</h1> -->
      <!-- Inline <ToolTip tip="Here is a tip"><div class="btn btn-primary">Hover</div></ToolTip> Inline
      Testing... -->
      <!-- <ButtonLoading :loading="loading" buttonStyle="btn-primary" @btnClick="consoleOut">Button!!</ButtonLoading> -->
      <div id="heading" style="color: black;">Here is some content about <span class="special-text-red">Activity Hub</span> and how to use it.</div>
    </div>
    <div id="background" class="my-5" style="background-color: #EFF8FF;">
      <!-- <h1>Testing Page</h1> -->
      <!-- Inline <ToolTip tip="Here is a tip"><div class="btn btn-primary">Hover</div></ToolTip> Inline
      Testing... -->
      <!-- <ButtonLoading :loading="loading" buttonStyle="btn-primary" @btnClick="consoleOut">Button!!</ButtonLoading> -->
      <div id="heading" style="color: black;">Here is some content about <span class="special-text-blue">Activity Hub</span> and how to use it.</div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
// import ButtonLoading from '../../components/Layouts/MainLayout/Elements/Buttons/ButtonLoading.vue';

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
#background {
  margin: 0 auto;
  height: fit-content;
  width: 80vw;
  background-color: #F2F2F2;
  border-radius: 1.25rem;
  padding: 3rem;
  // box-shadow: 5px 5px 10px rgb(188, 188, 188);
}
#heading {
  color: white;
  margin: 0 auto;
  max-width: 600px;
  font-size: 3rem;
  text-align: center;
  .special-text-blue {
    background: linear-gradient(to right, #6C0CD4, #253AD2, #1270C2, #00A3B2);
    background-clip: text;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
  }
  .special-text-red {
    background: linear-gradient(to right, #d4b90c, #d28a25, #c25b12, #b21500);
    background-clip: text;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
  }
}

</style>