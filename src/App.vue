<template>
  <input type="text" v-model="city" @keyup.enter="getJson">
  <button @click="getJson">Get json</button>
  <ForecastToday :forecast="forecast"></ForecastToday>
</template>

<script>

import {apiKey, apiUrl} from "@/constants";
import ForecastToday from "@/components/ForecastToday";

export default {

  name: 'App',
  components: {
    ForecastToday,
  },

  apiKey,
  data() {
    return {
      forecast: null,
      city: 'moscow',
    }
  },
  methods: {
    getJson() {
      const url = `${apiUrl}/current.json?key=${apiKey}&q=${this.city}`
      fetch(url)
          .then(response => response.json())
          .then(result => {
            this.forecast = result
          })
    }
  },
  mounted() {
    this.getJson()
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
