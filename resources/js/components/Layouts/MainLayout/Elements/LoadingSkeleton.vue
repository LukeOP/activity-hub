<template>
    <div class="loading-skeleton" :class="{ 'shimmer': shimmer }">
      <slot></slot>
    </div>
  </template>
  
  <script>
  export default {
    name: 'LoadingSkeleton',
    props: {
      shimmer: {
        type: Boolean,
        default: true
      }
    }
  }
  </script>
  
  <style scoped>
  .loading-skeleton {
    width: 100%;
    /* height: 100%; */
    background-color: #eee; /* Default background color */
    border-radius: 4px;
    display: inline-block; /* Ensure it takes up only the necessary space */
    overflow: hidden; /* Hide content overflowing the skeleton */
  }
  
  .shimmer {
    animation: shimmerEffect 2s infinite linear;
    background-image: linear-gradient(to right, #eee 0%, #f5f5f5 40%, #eee 100%);
    background-size: 200% auto;
  }
  
  @keyframes shimmerEffect {
    0% {
      background-position: -200% 0;
    }
    100% {
      background-position: 200% 0;
    }
  }
  </style>
  