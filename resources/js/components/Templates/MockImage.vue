<template>
    <div class="main-container">
        <div class="container" :class="{left: direction == 'left', right: direction == 'right', boxShadow: boxShadow}">
          <div class="tab-bar">
            <i class="fa-solid fa-circle red"></i>
            <i class="fa-solid fa-circle orange"></i>
            <i class="fa-solid fa-circle green"></i>
          </div>
          <slot class="content"></slot>
        </div>
    </div>
</template>

<script setup>
const props = defineProps({direction:String, boxShadow:{type: Boolean, default: true}})

</script>

<style lang="scss" scoped>
.main-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: fit-content;
    // background: #f0f0f0;
    margin: 0;
    perspective: 2000px;
  }
  .container {
    // background-color: blue;
    padding: 0;
    }
    .boxShadow {
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    }
  .left {
    transform: rotateY(20deg);
  }
  .right {
    transform: rotateY(-20deg);
  }
  .tab-bar {
    background: #ffffff;
    padding: 0px 10px;
    transform: translateZ(40px);
    transition: all 0.5s ease;
    border-top-left-radius: 0.25rem;
    border-top-right-radius: 0.25rem;
    border-bottom: 1px solid $ah-grey-lightest;
    .fa-circle {
      margin-right: 7px;
      font-size: 0.75rem;
    }
    .red {
      color: red;
    }
    .orange {
      color: orange;
    }
    .green {
      color: green;
    }
  }
  .content {
    width: 100%;
    height: fit-content;
    background-color: #ffffff;
  }

</style>