import { ref, watch, onMounted, onBeforeUnmount, computed } from 'vue';

export function useWindowSize() {
  const windowSize = ref({
    width: window.innerWidth,
    height: window.innerHeight,
  });

  const handleResize = () => {
    windowSize.value = {
      width: window.innerWidth,
      height: window.innerHeight,
    };
  };

  const mobileFormat = computed(() => {
    return windowSize.value.width < 769;
  });

  onMounted(() => {
    window.addEventListener('resize', handleResize);
  });

  onBeforeUnmount(() => {
    window.removeEventListener('resize', handleResize);
  });

  // watch(windowSize, (newVal, oldVal) => {
  //   console.log('Window size changed from', oldVal, 'to', newVal);
  // });

  return { windowSize, mobileFormat };
}