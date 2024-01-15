<template>
    <div class="background">
        <div class="content">
            <RouterView />
        </div>
    </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>
.background {
    height: 100vh;
    width: 100vw;
    position: fixed;
    top: 0;
    left: 0;
    background-color: #2e4f64cd;
}
.content {
    display: flex;
    margin: 3rem auto;
    max-width: 500px;
    // min-height: 700px;
    background-color: rgb(255, 255, 255);
    border-radius: 0.5rem;
}
@media (max-width: 768px) {
    .content {
        height: 100vh;
        margin: 0;
        border-radius: 0;
    }
}

</style>