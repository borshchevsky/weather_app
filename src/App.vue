<template>
  <input type="text" v-model="city" @keyup.enter="getJson">
  <button @click="getJson">Get json</button>
  <p v-if="json"> {{ json.location }}</p>
</template>

<script>

import {apiKey, apiUrl} from "@/constants";

export default {
  name: 'App',
  apiKey,
  data() {
    return {
      json: null,
      city: null,
    }
  },
  methods: {
    getJson() {
      const url = `${apiUrl}/current.json?key=${apiKey}&q=${this.city}`
      fetch(url)
          .then(response => response.json())
          .then(result => {
            this.json = result
          })
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
