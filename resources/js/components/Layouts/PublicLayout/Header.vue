<template>
  <div id="main">
    <header class="container">
      <div class="logo">
        <ActivityHubIconSVG />
        <span>Activity Hub</span>
        <!-- <img style="max-width: 200px;" src="/images/ActivityHub_Logo_Main.png" alt=""> -->
          <!-- <span style="font-family: 'Montserrat-Alt1';">Activity Hub</span> -->
        </div>
        <nav>
          <ul>
            <!-- <li><a href="#">Home</a></li> -->
            <li><a href="#">Features</a></li>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#" @click="router.push({name: 'Register'})">Log In</a></li>
            <li><a href="#" @click="router.push({name: 'Login'})" class="cta"><span class="me-2">Get started for free</span>
              <i class="fa-solid fa-arrow-right"></i></a></li>
          </ul>
        </nav>
      </header>
  </div>
</template>

<script setup>
  import { useRouter } from 'vue-router';
import ActivityHubIconSVG from '../MainLayout/Elements/SVG/ActivityHubIconSVG.vue'

  const router = useRouter()

</script>

<style lang="scss" scoped>

header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1em;
}

.logo {
  display: flex;
  align-items: center;
  height: 50px;
  width: fit-content;
  svg {
    max-width: 50px;
  }
  span {
    color: rgb(77, 77, 77);
    font-size: 1.5rem;
    margin-left: 8px; 
  }
}

nav ul {
  list-style: none;
  display: flex;
  margin: 0;
  padding: 0;
}

nav li {
  margin-right: 20px;
}

nav a {
  color: rgb(77, 77, 77);
  text-decoration: none;
  &:hover {
    border-bottom: 1px solid rgb(77, 77, 77);
  }
}

.cta {
  // background: linear-gradient(to right, #d47a0c, $ah-secondary);
  background: linear-gradient(to right, $ah-primary-dark, $ah-primary-light);
  color: white;
  padding: 10px 15px;
  border-radius: 40px;
  &:hover {
  // background: linear-gradient(to right, #bf6e0b, $ah-secondary-dark);
  background: linear-gradient(to right, $ah-primary-dark, $ah-primary);
  border: none;
  }
}
</style>
