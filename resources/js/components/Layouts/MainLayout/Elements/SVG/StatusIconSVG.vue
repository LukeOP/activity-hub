<template>
  <svg v-if="iconBackgroundColor" width="100%" height="100%" viewBox="0 0 58 58" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:1.5;">
      <circle :style="{ fill: iconBackgroundColor }" cx="28.546" cy="28.546" r="25.546" />
      <!-- Tick -->
      <path v-if="status === 'complete' || status === 'present' || status === 'late' || status === 'custom'" d="M16.243,28.579l8.18,8.181l16.427,-16.427" />
      <!-- Cross -->
      <g v-if="status === 'absent'">
          <path d="M20.333,37.747l16.427,-16.427" />
          <path d="M20.333,21.32l16.427,16.427" />
      </g>
      <g v-if="status === 'pending'">
        <text style="fill: rgb(255, 255, 255); font-size: 40px; font-weight: 550; white-space: pre;" transform="matrix(1, 0, 0, 1, 1.323214054107666, 18.292226791381832)">
          <tspan x="18" y="25">?</tspan><tspan x="10.633" dy="1em">​</tspan>
        </text>
      </g>
      <g v-if="status === 'incomplete'">
        <text style="fill: rgb(255, 255, 255); font-size: 33px; font-weight: 550; white-space: pre;" transform="matrix(1, 0, 0, 1, 1.323214054107666, 18.292226791381832)">
          <tspan x="23" y="23">!</tspan><tspan x="10.633" dy="1em">​</tspan>
        </text>
      </g>
    </svg>
</template>
  


<script>
const colors = {
  complete: '#198754',
  incomplete: '#e4002b',
  pending: '#bababa',
  present: '#3B657F',
  late: '#FFAE33',
  absent: '#e4002b',
  custom: '#800080'
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