<template>
    <section id="notifications">
        <i class="fa-regular fa-bell" :class="{'fa-solid': (showDropDown || iconHover)}" 
        @mouseenter="iconHover = true" @mouseleave="iconHover = false" @click="handleIconClick">
            <span class="notification-counter" v-if="notifications.length > 0">
                <span class="text">{{ notifications.length }}</span>
            </span>
        </i>

        <div id="notification-drop-down" v-if="showDropDown">
            <div class="triangle-container">
                <div id="triangle"></div>
            </div>
            <div class="drop-down-content">
                <header id="notification-header" class="unselectable">
                    <h1>Notifications</h1>
                    <!-- <i class="fa-solid fa-ellipsis options"></i> -->
                </header>
                <div class="notification-body">
                    <span v-if="notifications.length > 0">
                        <NotificationTile v-for="(notification, index) in notifications" :key="index" :notification="notification" @click="handleIconClick"/>
                    </span>
                    <!-- <NotificationTile /> -->
                    <div v-else class="no-notifications unselectable" @click="handleIconClick">You're all caught up! 	&#127881;</div>
                </div>
            </div>
        </div>
    </section id="notifications">
</template>

<script setup>
import { ref, watch } from 'vue';
import NotificationTile from './NotificationTile.vue'

const notifications = [
    // {icon: 'fa-regular fa-star', header: 'Lesson Updated', details: 'The lesson details have been updated.', route: 'LessonDetails', dataType: 'lesson', dataId: '01540814-23ec-40c8-a240-9372a576a538', created_at: '2024-05-24 03:55:03'},
    // {icon: 'fa-regular fa-star', header: 'Overdue Event Jobs', details: 'You have some overdue event jobs. Check them out', route: 'EventDetails', dataType: 'event', dataId: '07ff128f-a794-42c0-9c10-91c364827f27', created_at: '2024-05-22 03:55:03'}
]

const props = defineProps({backgroundStatus:Boolean})
const emit = defineEmits(['setBackground'])

const iconHover = ref(false)
const showDropDown = ref(false)

function handleIconClick(){
  showDropDown.value = !showDropDown.value
  emit('setBackground', !props.backgroundStatus)
}

watch(() => props.backgroundStatus, () => {
  props.backgroundStatus ? null : showDropDown.value = false
})

</script>

<style lang="scss" scoped>
#notifications {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    .fa-bell {
        color: $ah-primary;
        font-size: 2rem;
        position: relative;
        .notification-counter {
            font-size: 0.75rem;
            font-weight: bold;
            position: absolute;
            border: 2px solid white;
            background-color: #D63332;
            color: white;
            top: -5px;
            left: 16px;
            height: 25px;
            width: 25px;
            border-radius: 50%;
            transform: translate(40px 40px);
            display: flex;
            align-items: center;
            justify-content: center;
            span {
                -webkit-user-select: none; /* Safari */
                -ms-user-select: none; /* IE 10 and IE 11 */
                user-select: none; /* Standard syntax */
            }
        }
    }
    #notification-drop-down {
      position: absolute;
      right: -28px;
      top: 56px;
      width: 400px;
      max-height: 80vh;
      min-height: fit-content;
      background-color: white;
      box-shadow: 0px 0px 10px 3px $ah-grey;
      border-radius: 0.5rem;

      .triangle-container {
        position: relative;
        height: 20px;
        top: -20px;
        right: 22px;
        overflow: hidden;
          #triangle {
            position: relative;
            top: 15px;
            width: 40px;
            height: 40px;
            float: right;
            background-color: white;
            transform:rotate(45deg);
            box-shadow: 0px 0px 10px 3px $ah-grey;
          }
      }
      .drop-down-content {
          max-height: 80vh;
          #notification-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 37px;
            padding: 0px 20px;
            h1 {
                font-size: 1.5rem;
            }
            .options {
                font-size: 1.5rem;
            }
          }
          .notification-body {
                overflow: hidden;
                overflow-y: auto;
                max-height: calc(80vh - 157px);
                -ms-overflow-style: none;  /* IE and Edge */
                scrollbar-track-color: transparent;  /* Firefox */
                &::-webkit-scrollbar-track {
                    display: none; /* Chrome, Safari and Opera */
                }
    
                .no-notifications {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 10px;
                    height: 67px;
                    font-size: 1.25rem;
                }
            }
      }

    }
}

</style>