<template>
  <div class="center">
    <div>
      <input type="text" v-model="city" @keyup.enter="getForecast" placeholder="City name">
      <button @click="getForecast">Search</button>
      <ForecastToday :forecast="forecast"/>
      <ForecastList :forecast="forecast ? forecast.forecast.forecastday : []"/>
    </div>
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
      city: null,
    }
  },
  methods: {
    getForecast() {
      if (!this.city) {
        return
      }
      const url = `${apiUrl}/forecast.json?key=${apiKey}&q=${this.city}&days=6`
      fetch(url)
          .then(response => response.json())
          .then(result => {
            this.forecast = result
          })
    }
  },
  mounted() {
    this.getForecast()
  }
}
</script>

<style>
@import url('https://fonts.cdnfonts.com/css/lullabelle');

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 60px;
}

* {
  margin: 0;
  padding: 0;
  background: white;
}

input {
  padding: 10px;
  color: #555;
  border-radius: 7px;
  font-size: 16px;
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

label {
  margin: 10px;
  font-size: 24px;
}

.center {
  text-align: center;
  margin-left: 360px;
  margin-right: 360px;
}

</style>
