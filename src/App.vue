<template>
  <div>
    <input type="text" v-model="city" @keyup.enter="getJson">
    <button @click="getJson">Search</button>
    <ForecastToday :forecast="forecast"></ForecastToday>
    <ForecastList :forecast="forecast ? forecast.forecast.forecastday : []"/>
  </div>

</template>

<script>

import {apiKey, apiUrl} from "@/constants";
import ForecastToday from "@/components/ForecastToday";
import ForecastList from "@/components/ForecastList";

export default {

  name: 'App',
  components: {
    ForecastToday,
    ForecastList
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
      const url = `${apiUrl}/forecast.json?key=${apiKey}&q=${this.city}&days=6`
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

input {
  padding: 10px;
  color: #555;
  border-radius: 7px;
}

button {
  color: #fff;
  background-color: #0d6efd;
  line-height: 1.5;
  text-align: center;
  border: none;
  padding: 6px 12px;
  font-size: 16px;
  border-radius: 10px;
  box-shadow: none;
  margin: 10px;
}

</style>
