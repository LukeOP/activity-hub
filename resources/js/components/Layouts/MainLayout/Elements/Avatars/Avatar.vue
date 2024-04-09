<template>
  <span>
    <div class="avatar" v-if="user.attributes.image != null" :class="{mouseHover: hover}" @mouseenter="hover = true" @mouseleave="hover = false">
        <img :src="getAvatarSrc(user.attributes.image)" alt="">
    </div>
    <div class="avatar" :class="{mouseHover: hover}" v-else @mouseenter="hover = true" @mouseleave="hover = false">{{ initials }}</div>
    <div v-if="hover && name" class="dropdown-names">
      <span>{{ user.attributes.first_name }} {{ user.attributes.last_name }}</span>
    </div>
  </span>
</template>

<script setup>
import { computed, ref } from 'vue';

const props = defineProps({user: Object, hover:Boolean, name: Boolean})
const hover = ref(false)

const initials = computed(()=>{
    return getFirstLetter(props.user.attributes.first_name) + getFirstLetter(props.user.attributes.last_name)
})

function getFirstLetter(string){
  return string[0]
}

function getAvatarSrc(image) {
    // Get the public path to your storage folder
    const storagePath = `${window.location.origin}/storage`;

    // Return the full URL to the image
    return `${storagePath}/avatars/${image}`;
}

</script>

<style lang="scss" scoped>
.avatar{
  background-color: $ah-primary;
  border: 2px solid #FCFCFC;
  border-radius: 100%;
  display: flex;
  color: #ffffff;
  font-family: sans-serif;
  font-size: 18px;
  font-weight: 100;
  min-height: 40px;
  min-width: 40px;
  max-height: 40px;
  max-width: 40px;
  line-height: 40px;
  text-align: center;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  img{
    width:100%;
  }
}
.mouseHover {
    cursor: default;
  &:hover {
    border-color: $ah-primary;
  }
}
.dropdown-names {
  position:absolute;
  background-color: #f2f2f2;
  box-shadow: 0px 0px 5px $ah-grey;
  display: flex;
  flex-direction: column;
  border-radius: 1rem;
  z-index: 7000;
  span {
    padding: 3px 10px;
    width: fit-content;
  }
}
</style>