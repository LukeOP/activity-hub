<template>
    <div class="job-item" :class="{active: showDetails, overdue: isOverdue}">
        <div class="job-visible">
            <div class="job-details" @click="showDetails = !showDetails">
                <div>{{ job.description }}</div>
                <div>{{ job.due_date }}</div>
            </div>
            <div class="job-flags">
                <i class="fa-solid fa-users" :class="{userAssigned: jobAssignedToUser(), userAssignedActive: (jobAssignedToUser() && showDetails)}"></i>
                <JobStatus :job="job" />
            </div>
        </div>
        <div class="dropdown-options" v-if="showDetails" @click="showDetails = !showDetails">
            <p style="margin: 0;">Assigned to: </p>
            <AvatarStack :users="job.users" />
        </div>
        <div class="job-hidden" v-if="showDetails && (user.hasPermission('EVENTS_E', eventStore.getEvent.school.id) && eventStore.getEvent.attributes.archived == 0)">
            <div class="job-action" @click="openModal('EventJobAssign')">Assign</div>
            <div class="job-action" @click="openModal('EventJobEdit')">Edit</div>
            <div class="job-action" @click="openModal('EventJobDelete')">Delete</div>
        </div>
    </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useUserStore } from '../../../../stores/user';
import { useEventStore } from '../../../../stores/events';
import JobStatus from './JobStatus.vue'
import moment from 'moment';
import { useModalStore } from '../../../../stores/modal';
import AvatarStack from '../../../../components/Layouts/MainLayout/Elements/Avatars/AvatarStack.vue';

const props = defineProps({job: Object})
const showDetails = ref(false)
const user = useUserStore()
const eventStore = useEventStore()
const modal = useModalStore()

function jobAssignedToUser(){
    return props.job.users.some(u => u.attributes.id == user.attributes.id)
}

function openModal(type){
    eventStore.setSingleJob(props.job)
    modal.open(type)
}

const isOverdue = computed(() => {
    let today = moment().format('YYYY-MM-DD')
    return (props.job.due_date < today && props.job.status == 0)
})

</script>

<style lang="scss" scoped>
.job-item {
    .job-visible {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
        .job-details {
            width: 100%;
        }
        .job-flags {
            display: flex;
            align-items: center;
            .fa-users {
                color: $ah-grey;
                margin-right: 0.5rem;
            }
            .userAssigned {
                color: $ah-primary;
            }
            .userAssignedActive {
                color: white;
            }
        }
    }
    .dropdown-options {
        padding: 10px;
        .assigned-group {
            display: flex;
            flex-wrap: wrap;
            .job-assigned {
                margin-right: 0.25rem;
                &::after{
                    content: ', ';
                }
            }
            .activeUser {
                color: $ah-secondary;
            }
        }
    }
    .job-hidden {
        border: 1px solid $ah-primary;
        .job-action {
            text-align: center;
            padding: 10px;
            background-color: $ah-grey-background;
            color: black;
            border-bottom: 1px solid $ah-grey;
        }
    }
    &:nth-child(odd){
        background-color: $ah-primary-background;
    }
}
.active {
    background-color: $ah-primary-light !important;
    color: white;
    border-bottom: 1px solid $ah-grey;
}
.overdue {
  background-color: #fdefef !important;
  color: #C50023;
  &:hover {
  background-color: #fde0e0;
  }
}
</style>