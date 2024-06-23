<template>
  <div id="main-body">
    <Header />
    <section id="hero">
      <h1 id="heading" class="special-text-blue">Empower your extra-curricular programme</h1>
      <h2 id="sub-heading">with a streamlined management system.</h2>
      <button class="btn cta mt-2"><span class="me-2">Start your free trial</span><i class="fa-solid fa-arrow-right"></i></button>
      <MockImage style="max-width: 900px; margin: 4rem auto 0 auto" :boxShadow="false">
        <SideBarTemplate activeMenu="dashboard">
          <TopBarTemplate :filter="false">
            <DashboardTemplate />
          </TopBarTemplate>
        </SideBarTemplate>
      </MockImage>
    </section>
    <section id="demo">
      <img class="image" src="images/UI/AH-demo.png" alt="">
      <div class="shadow"></div>
    </section>
    <section id="features">
      <div id="feature-content">
        <h2>Features</h2>

        <div class="feature-content-single">
          <div class="image">
            <!-- <img src="images/ActivityHub_Logo_Main_250W.png" alt=""> -->
            <MockImage direction="left">
              <SideBarTemplate activeMenu="attendance">
                <TopBarTemplate>
                  <AttendanceTemplate />
                </TopBarTemplate>
              </SideBarTemplate>
            </MockImage>
          </div>
          <div class="content">
            <h3 class="special-text-blue">Lesson Planning, Attendance and Scheduling</h3>
            <p>Manage Lesson planning, scheduling and attendance all in one place and never lose track of when lessons are occuring.</p>
            <p>Dashboard tiles help to provide a quick glimpse at what is happening in your department and any upcoming lessons, or events you should know about. All updated in realtime.</p>
            <button class="btn cta mt-2"><span class="me-2">Learn more about Lessons and Attendance</span><i class="fa-solid fa-arrow-right"></i></button>
          </div>
        </div>

        <div class="feature-content-single">
          <div class="content">
            <h3 class="special-text-blue">Event Manangement</h3>
            <p></p>
            <button class="btn cta mt-2"><span class="me-2">Learn more about Event Management</span><i class="fa-solid fa-arrow-right"></i></button>
          </div>
          <div class="image">
            <!-- <img src="images/ActivityHub_Logo_Main_250W.png" alt=""> -->
            <MockImage direction="right">
              <SideBarTemplate activeMenu="events">
                <TopBarTemplate :filter="false">
                  <EventTemplate />
                </TopBarTemplate>
              </SideBarTemplate>
            </MockImage>
          </div>
        </div>

        <div class="feature-content-single">
          <div class="image">
            <!-- <img src="images/ActivityHub_Logo_Main_250W.png" alt=""> -->
            <MockImage direction="left">
              <SideBarTemplate activeMenu="instruments">
              </SideBarTemplate>
            </MockImage>
          </div>
          <div class="content">
            <h3 class="special-text-blue">Asset Manangement and Hire</h3>
            <p></p>
            <button class="btn cta mt-2"><span class="me-2">Learn more about Assets and Hire</span><i class="fa-solid fa-arrow-right"></i></button>
          </div>
        </div>

      </div>
    </section>
  </div>
</template>

<script setup>
import Header from '../../components/Layouts/PublicLayout/Header.vue'
import MockImage from '../../components/Templates/MockImage.vue'
import SideBarTemplate from '../../components/Templates/SideBarTemplate.vue'
import DashboardTemplate from '../../components/Templates/DashboardTemplate.vue'
import AttendanceTemplate from '../../components/Templates/AttendanceTemplate.vue'
import TopBarTemplate from '../../components/Templates/TopBarTemplate.vue'
import EventTemplate from '../../components/Templates/EventTemplate.vue'

</script>

<style lang="scss" scoped>
#main-body {
  height: 100vh;
  // background-color:#FDFDFB;
  background-color: #fafcfd;
  p {
    font-size: 1.2rem;
  }
}
#hero {
  padding-top: 6rem;
  margin: 0rem auto 0 auto;
  display: flex;
  justify-content: center;
  flex-direction: column;
  background-position: 0px 0px;
  background-image: radial-gradient(circle 750px at bottom, $ah-primary, $ah-primary-light, $ah-primary-background,  #fafcfd);
  background-repeat: no-repeat;
  #heading {
    margin: 0 auto;
    max-width: 1000px;
    font-size: 3rem;
    text-align: center;
  }
  #sub-heading {
    margin: 0 auto;
    max-width: 1000px;
    font-size: 1.6rem;
    color: rgb(77, 77, 77);
  }
}
.special-text-blue {
  background: linear-gradient(to right, $ah-primary-dark, #1270C2, #529ee0);
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
      width: 100%;
      // border-radius: 20px;
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

.cta {
  background: linear-gradient(to right, $ah-primary-dark, $ah-primary-light);
  color: white;
  padding: 10px 15px;
  border-radius: 40px;
  max-width: fit-content;
  margin: 0 auto;
  &:hover {
  background: linear-gradient(to right, $ah-primary-dark, $ah-primary);
  color: white;
  }
}

</style>