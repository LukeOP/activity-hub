<template>
    <div>
        <h2 class="text-center mb-3">Event Job Options</h2>
        <div class="actions">
            <div v-for="action in actions" :key="action" class="action" @click="modal.open(action.modal)">
                <div class="icon-image"><i :class="action.icon" /></div>
                <div class="title">{{ action.title}}</div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { useModalStore } from '../../../../stores/modal';
import { useEventStore } from '../../../../stores/events';

    const modal = useModalStore()
    const actions = [
        {title: 'Assign', modal: 'EventJobAssign', icon: 'fa-solid fa-user-check'},
        {title: 'Edit', modal: 'EventJobEdit', icon: 'fa-regular fa-pen-to-square'},
        {title: 'Delete', modal: 'EventJobDelete', icon: 'fa-solid fa-trash'},
    ]

</script>

<style lang="scss" scoped>
.actions {
    display: flex;
    justify-content: space-between;
}
.action {
    text-align: center;
    box-shadow: 5px 5px 10px lightgray;
    border-radius: 0.25rem;
    width: 50%;
    margin: 0.5rem;
    &:hover {
        cursor: pointer;
        background-color: $ah-primary-light;
        color: white;
        .icon-image {
            color: $ah-primary;
        }
    }
    &:first-of-type {
        margin-left: 1rem;
    }
    &:last-of-type {
        margin-right: 1rem;
    }
    .icon-image {
        height: 150px;
        color: $ah-primary;
        font-size: 6em;
        background-color: $ah-primary-background;
        i {
            margin: auto;
        }
    }
    .title {
        padding: 10px;
        // border-top: 1px solid $ah-primary;
    }
}
@media (max-width: 768px){
    .actions {
        max-height: 80vh;
        display:block;
        width: 100%;
        .action {
            width: 85%;
            margin: 0 auto;
            margin-bottom: 1rem;
            .icon-image {
                height: 100px;
                color: $ah-primary;
                background-color: $ah-primary-background;
                font-size: 5em;
                i {
                    margin: auto;
                }
            }
        }
    }
}

</style>