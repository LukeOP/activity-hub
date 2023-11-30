<template>
  <div>
    <Modal :modalActive="modalActive" @close="closeModal" >
      <component :is="currentComponent" />
    </Modal>
  </div>
</template>

<script setup>
import { computed } from "vue";
import Modal from "./Elements/Modal.vue";
import { useModalStore } from '../../../stores/modal'

import modalComponents from '../../../composables/modalComponents'

const modal = useModalStore()

const currentComponent = computed(() => modalComponents[modal.getType] || null);

const modalActive = computed(() => modal.getActiveState);

function closeModal() {
  modal.close();
}
</script>

<style lang="scss" scoped>

</style>
