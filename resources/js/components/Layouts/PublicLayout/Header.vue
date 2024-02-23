<template>
  <div id="main">
    <header class="container">
      <div class="logo">
        <ActivityHubIconSVG />
        <span style="font-family: Nunito; font-size: 2rem; color: white; font-weight: 300; letter-spacing:0.25rem;">Activity Hub</span>
        <!-- <img style="max-width: 200px;" src="/images/ActivityHub_Logo_Main.png" alt=""> -->
          <!-- <span style="font-family: 'Montserrat-Alt1';">Activity Hub</span> -->
        </div>
        <nav>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Features</a></li>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">About Us</a></li>
            <li class="auth-buttons">
              <a href="#" @click="router.push({name: 'Register'})">Sign Up</a>
              <a href="#" @click="router.push({name: 'Login'})">Log In</a>
            </li>
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
#main {
  background-color: rgba(255, 255, 255, 0.483);
  background-color: $ah-primary;
}

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
    color: $ah-primary;
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
  text-decoration: none;
  color: white;
  font-weight: bold;
  &:hover {
    border-bottom: 1px solid white;
  }
}

.auth-buttons a {
  background-color: white;
  color: $ah-primary;
  // color: #fff;
  padding: 8px 15px;
  border-radius: 5px;
  margin-left: 20px;
  // border: $ah-primary;
  border: 2px solid transparent;
  &:hover {
    background-color: $ah-primary-dark;
    color: white;
    border: 2px solid white;
    cursor: pointer;
  }
}
</style>
