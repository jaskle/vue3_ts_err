<template>
  <nav>
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
    <div>{{msg}}</div>
  </nav>
  <router-view/>
</template>

<script lang="ts" setup>
import { ref } from 'vue'

const msg = ref('Hello World!')
const myObj = <{ [key: string]: string }>{
  a: '123'
}
msg.value = myObj.a
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
