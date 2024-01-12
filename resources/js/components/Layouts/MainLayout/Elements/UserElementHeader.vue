<template>
    <div>
        <div class="user-element-header">
          <div>{{ heading }}</div>
          <!-- <div class="options" @click="dropdown = !dropdown">&#9679;&#9679;&#9679;</div> -->
          <div v-if="dropdown" class="drop-menu">
            <div class="selection">
                <span>Manage Dashboard Tiles</span>
                <span>Manage Dashboard Tiles</span>
                <span>Manage Dashboard Tiles</span>
            </div>
          </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from "vue"

const props = defineProps({
    heading: String
})
const dropdown = ref(false)

</script>

<style lang="scss" scoped>
.options {
    &:hover {
        color: $ah-primary;
    }
}
.drop-menu {
    position: absolute;
    top: 41px;
    right: 0;
    min-width: 150px;
    background: pink;
    .selection {
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        span {
            // &:first-of-type {
            //     margin-top: 40px;
            // }
            font-size: 0.9rem;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
            background: #f9f9f9;
            &:hover {
                cursor: pointer;
                background-color: $ah-primary-background;
            }
        }
    }
}

</style>