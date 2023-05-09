import { ref, watch, onMounted, onBeforeUnmount } from 'vue';

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

  onMounted(() => {
    window.addEventListener('resize', handleResize);
  });

  onBeforeUnmount(() => {
    window.removeEventListener('resize', handleResize);
  });

  // watch(windowSize, (newVal, oldVal) => {
  //   console.log('Window size changed from', oldVal, 'to', newVal);
  // });

  return windowSize;
}