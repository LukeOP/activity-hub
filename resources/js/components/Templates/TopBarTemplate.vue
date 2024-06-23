<template>
    <div id="topBar">
        <div class="bar-elements">
            <div class="sideBars">
                <div class="menu" id="actions" v-if="actions">
                    <span class="text">Actions</span>
                    <i class="fa-solid fa-gears"></i>
                </div>
                <div class="menu" id="filter" v-if="filter">
                    <span class="text">Filter</span>
                    <i class="fa-solid fa-filter"></i>
                </div>
            </div>
            <div class="profile">
                <div>
                    <i id="bell" class="fa-regular fa-bell"></i>
                </div>
                <div>
                    <div id="avatar">AP</div>
                </div>
            </div>
        </div>
        <slot></slot>
    </div>
</template>

<script setup>

const props = defineProps({
    actions: {type: Boolean, default: true}, 
    filter: {type: Boolean, default: true}
})

</script>

<style lang="scss" scoped>
.bar-elements {
    display: flex;
    gap: 2px;
    margin-bottom: 1rem;
    padding-right: 5%;
    justify-content: space-between;
    .sideBars {
        display: flex;
        gap: 3px;
        max-height: 20px;
        .menu {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 50px;
            font-size: 0.5rem;
            color: white;
            padding: 2px 5px;
            &:last-of-type {
                border-bottom-right-radius: 0.5rem;
            }
        }
        #actions {
            background-color: $ah-secondary;
        }
        #filter {
            background-color: $ah-grey;
        }
    }
    .profile {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        #bell {
            color: $ah-primary;
            font-size: 1.2rem;
            transform: translateY(3px);
        }
        #avatar {
            color: white;
            background-color: $ah-primary;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    }
}
</style>