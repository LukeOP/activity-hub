<template>
  <transition name="modal-animation">
    <div v-show="modalActive" class="modal">
      <transition name="modal-animation-inner">
        <div v-show="modalActive" class="modal-inner">
          <i @click="close" class="icon" v-html="icons.xmark"></i>
          <!-- Modal Content -->
          <slot />
        </div>
      </transition>
    </div>
  </transition>
</template>

<script>
import { icons } from '@/images/icons/icons'
export default {
  props: ["modalActive"],
  setup(props, { emit }) {
    const close = () => {
      emit("close");
    };

    return { close, icons };
  },
};
</script>


<style lang="scss" scoped>
.modal-animation-enter-active,
.modal-animation-leave-active {
  transition: opacity 0.2s cubic-bezier(0.52, 0.02, 0.19, 1.02);
}

.modal-animation-enter-from,
.modal-animation-leave-to {
  opacity: 0;
}

.modal-animation-inner-enter-active {
  transition: all 0.2s cubic-bezier(0.52, 0.02, 0.19, 1.02) 0.15s;
}

.modal-animation-inner-leave-active {
  transition: all 0.2s cubic-bezier(0.52, 0.02, 0.19, 1.02);
}

.modal-animation-inner-enter-from {
  opacity: 0;
  transform: scale(0.9);
}

.modal-animation-inner-leave-to {
  transform: scale(0.9);
}

.modal {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100vw;
  position: fixed;
  top: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.2);

  .modal-inner {
    position: relative;
    max-width: 640px;
    width: 80%;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    background-color: #fff;
    padding: 64px 16px;
    border-radius: 1.5rem;

    i {
      position: absolute;
      top: 15px;
      right: 15px;
      font-size: 20px;
      cursor: pointer;
    }

    button {
      padding: 20px 30px;
      border: none;
      font-size: 16px;
      background-color: $ah-primary;
      color: #fff;
      cursor: pointer;
    }
  }
}
.icon {
  width: 20px;
  fill: $ah-grey;
  &:hover {
    fill: $ah-primary;
  }
}
@media (max-width: 768px) {
  .modal {
    .modal-inner {
      width: 99%;
    }
  }
}
</style>
