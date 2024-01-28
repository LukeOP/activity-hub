<template>
    <div class="background">
        <div class="content">
            <div style="width: 100%;">
                <div id="loginContainer">
                    <img id="logo-img" src="/images/ActivityHub_Logo_Main.png" alt="Activity Hub Logo">
                    
                    <RouterView />

                </div>
            </div>
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
    position: fixed;
    display: flex;
    top: 50%;
    left: 50%;
    width: 100%;
    transform: translate(-50%, -50%);
    max-width: 500px;
    // margin: 3rem auto;
    background-color: rgb(255, 255, 255);
    border-radius: 0.5rem;
}
#loginContainer {
  position: relative;
  max-width: 500px;
  padding: 10px;
  border-radius: 10px;
  text-align: center;
  margin: 3rem 0;

  #logo-img {
    position: relative;
    width: 100%;
    max-width: 250px;
    margin: 0 auto;
    margin-top: 2rem;
    margin-bottom: 1rem;
  }
}
@media (max-width: 768px) {
    .content {
        height: 100vh;
        margin: 0;
        border-radius: 0;
    }
}
@media (max-height: 645px) {
    .content {
        height: fit-content;
        max-width: 100vw;
        border-radius: 0;
        #loginContainer {
            margin: 0 auto;
        }
    }
}

</style>