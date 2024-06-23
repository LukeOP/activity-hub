<template>
    <div id="attendanceReview">
        <div class="headerLine">
            <div class="text-primary">Jazz Band at Johnstonville Primary - Event Details</div>
            <div class="school">Pinecrest School</div>
        </div>
    </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>
.headerLine {
    width: 95%;
    margin: 0 auto;
    border-bottom: 1px solid $ah-primary;
    display: flex;
    justify-content: space-between;
    margin-bottom: 1rem;
}
.school {
    color: $ah-primary;
    font-size: 0.45rem;
}
.table {
    width: 95%;
    margin: 0 auto;
    thead > tr > td {
        background-color: $ah-primary;
        color: white;
        font-size: 0.5rem;
        padding: 2px;
    }
    tbody > tr > td {
        font-size: 0.5rem;
        padding: 4px 2px;
    }
}
.flag {
    width: 25px;
}
.quarter {
    width: 15%;
}
#searchBox {
    margin-left: 2.5%;
    width: 200px;
    height: 20px;
    border:1px solid rgb(241, 241, 241);
    border-radius: 0.25rem;
    margin-bottom: 5px;
    span {
        display: flex;
        align-items: center;
        font-size: 0.60rem;
        padding-left: 10px;
        color: $ah-grey-dark;
    }
}

</style>