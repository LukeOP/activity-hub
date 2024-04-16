<template>
    <div style="text-align:center; display: inline-block;">
    
      <div :class="{toolTip: tip}">
        <slot></slot>
        <span class="tool-tip-text">{{ tip }}</span>
      </div>
    
    </div>
</template>

<script setup>
const props = defineProps({tip:String})

</script>
  
<style>
  .toolTip {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted #3B6580;
    cursor:help;
  }
  
  .toolTip .tool-tip-text {
    visibility: hidden;
    width: 200px;
    background-color: #3B6580;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px;
    position: absolute;
    z-index: 1;
    top: 150%;
    left: 50%;
    transform: translateX(-50%);
  }
  
  .toolTip .tool-tip-text::after {
    content: "";
    position: absolute;
    bottom: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: transparent transparent #3B6580 transparent;
  }
  
  .toolTip:hover .tool-tip-text {
    visibility: visible;
  }
  </style>
  
  
  
  