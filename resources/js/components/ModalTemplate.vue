<template>
  <div class="full-container" @click.self="close">
    <div class="main-container">
      <div id="header">
        <h3 style="flex-grow:1; width:fit-content; display:inline-block">{{title}}</h3>
        <i class="fa-solid fa-xmark fa-2x float-end me-2" @click="close"></i>
      </div>
      <div id="body">
        <slot />
      </div>
    </div>
  </div>
</template>

<script>
import { useRouter } from 'vue-router'
export default {
  props: {
    title: String,
    data: Array,
    push: Object
  },
  emits: ["close", "refresh-notes"],
  setup(props){
    const router = useRouter()

    function close(){
      router.push(props.push)
    }

    return { 
    close }
  }

}
</script>

<style lang="scss" scoped>
.full-container {
  position: fixed;
  top: 0px;
  left: 0px;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 100;

  .main-container {
    position: fixed;
    height: fit-content;
    max-height: 80%;
    min-height: 50px;
    min-width: 50%;
    max-width: 50%;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    border-radius: 0.25rem;

    #header {
      width: 100%;
      padding: 10px;
      height:50px;
      border-radius: 0.25rem 0.25rem 0 0;
      background-color: $ah-primary-dark;
      color: white;

      h3 {
        padding-left: 10px;
      }

      .fa-xmark {
        cursor: pointer;
        &:hover {
          color: $ah-background-dark;
        }
      }
    }
  }

}
/* Styles for mobile */
@media (max-width: 768px) {
  .full-container {
    .main-container {
      transform: none;
      top: 2%;
      left: 2%;
      min-width:96%;
      height: calc(100vh * 0.96);
    }
  }
}
</style>>