<template>
    <div class="avatars" >
        <Avatar v-for="user in sortedUsers.slice(0, 3)" :user="user" :name="true" class="avatars__item"/>
        <div v-if="sortedUsers.length > 3" class="avatars__item additional" @mouseenter="hover = true" @mouseleave="hover = false">+{{ sortedUsers.length - 3 }}</div>
        <div v-if="hover" class="dropdown-names">
          <span v-for="user in sortedUsers.slice(3)" :key="user">{{ user.attributes.first_name }} {{ user.attributes.last_name }}</span>
        </div>
    </div>
</template>

<script setup>
import { computed, ref } from 'vue';
import Avatar from './Avatar.vue';
import useSorter from '../../../../../composables/useSorter';

    const props = defineProps({users: Array})
    const sorter = useSorter()
    const sortedUsers = computed(()=>{
      sorter.sort(props.users, 'attributes.last_name')
      return props.users
    })
    const hover = ref(false)

</script>

<style lang="scss" scoped>

.avatars {
  display: flex;
  list-style-type: none;
  padding: 0px;
  flex-direction: row;
  cursor: default;
	&__item{
		margin-left: -5px;
    &:first-child {
      z-index: 1;
    }
    &:nth-child(2) {
      z-index: 2;
    }
    &:nth-child(3) {
      z-index: 3;
    }
    &:nth-child(4) {
      z-index: 4;
    }
    img{width:100%}
	}
}
.additional {
  background-color: $ah-grey;
  border: 2px solid #FCFCFC;
  border-radius: 100%;
  color: #ffffff !important;
  font-family: sans-serif;
  font-size: 18px;
  font-weight: 100;
  height: 40px;
  width: 40px;
  z-index: 5;
  text-decoration: none;
  font-size: larger;
  display: flex;
  align-items: center;
  justify-content: center;
  &:hover {
    border-color: $ah-grey-light;
  }
}
.dropdown-names {
  position:absolute;
  transform: translateY(40px);
  background-color: #f2f2f2;
  box-shadow: 0px 0px 5px $ah-grey-light;
  display: flex;
  flex-direction: column;
  border-radius: 1rem;
  z-index: 7;
  span {
    padding: 3px 10px;
    min-width: 150px;
    width: fit-content;
  }
}
</style>