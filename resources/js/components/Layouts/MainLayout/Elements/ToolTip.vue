<template>
    <div style="text-align:center; display: inline-block;">
    
    <div class="tool-tip"><slot />
      <span class="tool-tip-text">{{ tip }}</span>
    </div>
    
    </div>
</template>

<script setup>
const props = defineProps({tip:String})

</script>
  
<style>
  .tool-tip {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted black;
    cursor:help;
  }
  
  .tool-tip .tool-tip-text {
    visibility: hidden;
    width: 120px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    position: absolute;
    z-index: 1;
    top: 150%;
    left: 50%;
    margin-left: -60px;
  }
  
  .tool-tip .tool-tip-text::after {
    content: "";
    position: absolute;
    bottom: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: transparent transparent black transparent;
  }
  
  .tool-tip:hover .tool-tip-text {
    visibility: visible;
  }
  </style>
  
  
  
  