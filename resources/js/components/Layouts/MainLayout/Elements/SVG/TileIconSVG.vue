<template>
  <svg v-if="iconBackgroundColor" width="100%" height="100%" viewBox="0 0 58 58" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:1.5;">
      <circle :style="{ fill: iconBackgroundColor }" cx="28.546" cy="28.546" r="25.546" />
      <!-- Tick -->
      <path v-if="icon === 'users'" :style="{ fill: iconColor}" style="transform: translate(17px, 15.5px);" d="M12,16a4,4,0,1,1,4-4A4,4,0,0,1,12,16ZM5.683,16H1a1,1,0,0,1-1-1A6.022,6.022,0,0,1,5.131,9.084a1,1,0,0,1,1.1,1.266A6.009,6.009,0,0,0,6,12a5.937,5.937,0,0,0,.586,2.57,1,1,0,0,1-.9,1.43ZM17,24H7a1,1,0,0,1-1-1,6,6,0,0,1,12,0A1,1,0,0,1,17,24ZM18,8a4,4,0,1,1,4-4A4,4,0,0,1,18,8ZM6,8a4,4,0,1,1,4-4A4,4,0,0,1,6,8Zm17,8H18.317a1,1,0,0,1-.9-1.43A5.937,5.937,0,0,0,18,12a6.009,6.009,0,0,0-.236-1.65,1,1,0,0,1,1.105-1.266A6.022,6.022,0,0,1,24,15,1,1,0,0,1,23,16Z" />
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
  blue: '#EFF4FF',
  blue_icon: '#136ba5',
  orange: '#FFF7E1',
  orange_icon: '#FFAE33',
  red: '#FFF4F0',
  red_icon: '#FF8F6B',
  green: '#e3f2eb',
  green_icon: '#198754',
  grey: '#f2f2f2',
  purple: '#f2daf2'
}

export default {
  name: 'TileIcon',

  props: {
      status: {
          type: String,
          default: '',
      },
      icon: {
        type: String,
      },
      color: {
        type: String,
      }
  },

  computed: {
      iconBackgroundColor() {
          return colors[this.color]
      },
      iconColor(){
        return colors[`${this.color}_icon`]
      }
  }
}
</script>

<style scoped>
path {
  margin-top: 20px;
}
</style>