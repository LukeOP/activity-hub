<template>
    <div class="tile user-element">
        <div class="image"><i class="fa-solid fa-plus fa-3x"></i></div>
        <div>
            <div class="number">Create New</div>
            <!-- <div class="reference">Active Lessons</div> -->
        </div>
    </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>
.tile {
    min-width: 300px;
    min-height: 100px;
    display: flex;
    background: $ah-secondary;
    color: white;
    &:hover {
        box-shadow: 0px 10px 10px $ah-grey;
        cursor: pointer;
    }
}
.image {
    padding: 0 20px;
}
.number {
    // font-weight: bold;
    font-size: 1.5rem;
}

</style>