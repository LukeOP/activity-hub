<template>
  <div id="main-body">
    <Header />
    <section id="hero">
      <h1 id="heading" class="special-text-blue">Empower your extra-curricular programme</h1>
      <h2 id="sub-heading">with a streamlined management system.</h2>
      <button class="btn cta mt-2"><span class="me-2">Start your free trial</span><i class="fa-solid fa-arrow-right"></i></button>
    </section>
    <section id="demo">
      <img class="image" src="images/UI/AH-demo.png" alt="">
      <div class="shadow"></div>
    </section>
    <section id="features">
      <div id="feature-content" class="container">
        <h2>Features</h2>

        <div class="feature-content-single">
          <div class="image">
            <img src="images/ActivityHub_Logo_Main_250W.png" alt="">
          </div>
          <div class="content">
            <h3 class="special-text-blue">Lesson Planning, Attendance and Scheduling</h3>
          </div>
        </div>

        <div class="feature-content-single">
          <div class="content">
            <h3 class="special-text-blue">Event Manangement</h3>
          </div>
          <div class="image">
            <img src="images/ActivityHub_Logo_Main_250W.png" alt="">
          </div>
        </div>

        <div class="feature-content-single">
          <div class="image">
            <img src="images/ActivityHub_Logo_Main_250W.png" alt="">
          </div>
          <div class="content">
            <h3 class="special-text-blue">Asset Manangement and Hire</h3>
          </div>
        </div>

      </div>
    </section>
  </div>
</template>

<script setup>
import Header from '../../components/Layouts/PublicLayout/Header.vue'

</script>

<style lang="scss" scoped>
#main-body {
  height: 100vh;
  // background-color:#FDFDFB;
  background-color: #fafcfd;
}
#hero {
  margin: 6rem auto;
  display: flex;
  justify-content: center;
  flex-direction: column;
  #heading {
    margin: 0 auto;
    max-width: 1000px;
    font-size: 3rem;
  }
  #sub-heading {
    margin: 0 auto;
    max-width: 1000px;
    font-size: 1.6rem;
    color: rgb(77, 77, 77);
  }
  .cta {
  background: linear-gradient(to right, $ah-primary-dark, $ah-primary-light);
  color: white;
  padding: 10px 15px;
  border-radius: 40px;
  max-width: fit-content;
  margin: 0 auto;
  &:hover {
  background: linear-gradient(to right, $ah-primary-dark, $ah-primary);
  }
}
}
.special-text-blue {
  background: linear-gradient(to right, $ah-primary-dark, #1270C2, $ah-primary-light);
  background-clip: text;
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
}
.special-text-red {
  background: linear-gradient(to right, #d47a0c, $ah-secondary);
  background-clip: text;
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
}
#demo {
  display: flex; 
  justify-content: center;
  .image {
    max-width: 1000px;
  }
}
#features {
  background-color: $ah-primary-background;
  padding: 2rem 0;
  #feature-content {
    min-height: 300px;
    h2 {
      text-align: center;
      font-size: 2rem;
      margin-bottom: 2rem;
    }
    .feature-content-single {
      background-color: #fafcfd;
      border-radius: 20px;
      margin-bottom: 2rem;
      display: flex;
      padding: 90px 50px;
      color: rgb(77, 77, 77);
      .image {
        width: 50%;
      }
      .content {
        width: 50%;
        h3 {
          font-size: 2rem;

        }
      }
    }
  }
}

</style>