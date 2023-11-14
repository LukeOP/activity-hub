<template>
  <svg v-if="iconBackgroundColor" width="100%" height="100%" viewBox="0 0 58 58" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:1.5;">
      <circle :style="{ fill: iconBackgroundColor }" cx="28.546" cy="28.546" r="25.546" />
      <path v-if="status === 'complete'" d="M16.243,28.579l8.18,8.181l16.427,-16.427" />
      <g v-if=" status === 'incomplete' || status === 'pending'">
          <path d="M20.333,37.747l16.427,-16.427" />
          <path d="M20.333,21.32l16.427,16.427" />
      </g>
  </svg>
</template>

<script>
const colors = {
  complete: '#198754',
  incomplete: '#e4002b',
  pending: '#bababa',
}

export default {
  name: 'StatusIcon',

  props: {
      status: {
          type: String,
          default: '',
          validator(status) {
            return colors[status] || status === ''
          }
      }
  },

  computed: {
      iconBackgroundColor() {
          return colors[this.status]
      }
  }
}
</script>

<style scoped>
path,
circle {
  stroke: #ffffff;
  stroke-width: 6px;
  fill: none;
}
</style>