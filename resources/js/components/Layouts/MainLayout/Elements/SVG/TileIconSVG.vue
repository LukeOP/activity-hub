<template>
  <svg v-if="iconBackgroundColor" width="100%" height="100%" viewBox="0 0 58 58" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:1.5;">
      <circle :style="{ fill: iconBackgroundColor }" cx="28.546" cy="28.546" r="25.546" />
      <!-- Users -->
      <path v-if="icon === 'users'" :style="{ fill: iconColor}" style="transform: translate(17px, 15.5px);" d="M12,16a4,4,0,1,1,4-4A4,4,0,0,1,12,16ZM5.683,16H1a1,1,0,0,1-1-1A6.022,6.022,0,0,1,5.131,9.084a1,1,0,0,1,1.1,1.266A6.009,6.009,0,0,0,6,12a5.937,5.937,0,0,0,.586,2.57,1,1,0,0,1-.9,1.43ZM17,24H7a1,1,0,0,1-1-1,6,6,0,0,1,12,0A1,1,0,0,1,17,24ZM18,8a4,4,0,1,1,4-4A4,4,0,0,1,18,8ZM6,8a4,4,0,1,1,4-4A4,4,0,0,1,6,8Zm17,8H18.317a1,1,0,0,1-.9-1.43A5.937,5.937,0,0,0,18,12a6.009,6.009,0,0,0-.236-1.65,1,1,0,0,1,1.105-1.266A6.022,6.022,0,0,1,24,15,1,1,0,0,1,23,16Z" />
      <path v-if="icon === 'instrument'" :style="{fill: iconColor}" viewBox="0 0 58 58" d="M465 7c-9.4-9.4-24.6-9.4-33.9 0L383 55c-2.4 2.4-4.3 5.3-5.5 8.5l-15.4 41-77.5 77.6c-45.1-29.4-99.3-30.2-131 1.6c-11 11-18 24.6-21.4 39.6c-3.7 16.6-19.1 30.7-36.1 31.6c-25.6 1.3-49.3 10.7-67.3 28.6C-16 328.4-7.6 409.4 47.5 464.5s136.1 63.5 180.9 18.7c17.9-17.9 27.4-41.7 28.6-67.3c.9-17 15-32.3 31.6-36.1c15-3.4 28.6-10.5 39.6-21.4c31.8-31.8 31-85.9 1.6-131l77.6-77.6 41-15.4c3.2-1.2 6.1-3.1 8.5-5.5l48-48c9.4-9.4 9.4-24.6 0-33.9L465 7zM208 256a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/>
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