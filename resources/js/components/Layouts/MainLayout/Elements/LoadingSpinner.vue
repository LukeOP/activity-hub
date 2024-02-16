<template>
    <div class="loading-spinner" v-if="isLoading">
        <div class="spinner" :class="color"></div>
        <div class="loading-text" v-if="loadingText">Loading...</div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'LoadingSpinner',
    props: {
      isLoading: {
        type: Boolean,
        required: true
      },
      loadingText: {
        type: Boolean,
        required: false
      },
      color: {
        type: String,
        required: false
      }
    }
  }
  </script>
  
  <style lang="scss" scoped>
    .loading-spinner {
        display: flex;
        // flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    
    .spinner {
        border: 3px solid white;
        border: 3px solid rgba(0, 0, 0, 0.1);
        border-left-color: white;
        border-radius: 50%;
        height: 20px;
        width: 20px;
        animation: spin 1s linear infinite;
    }

    .loading-text {
    margin-left: 10px;
    }

    .primary {
        border-left-color: $ah-primary;
    }
  
    @keyframes spin {
        0% {
        transform: rotate(0deg);
        }
        100% {
        transform: rotate(360deg);
        }
    }
  </style>
  