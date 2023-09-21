<template>
  <div class="cell">
    <strong>
      {{
        forecast.date.toLocaleDateString('en-EN', {
          day: 'numeric',
          month: 'short'
        })
      }}
    </strong>
    <p>
      <img :src="img" alt="">
    </p>
    <p>Min temp: {{ forecast.day.mintemp_c }}</p>
    <p>Max temp: {{ forecast.day.maxtemp_c }}</p>
    <p>Humidity: {{ forecast.day.avghumidity }}</p>
    <p>Sunrise: {{ forecast.astro.sunrise }}</p>
    <p>Sunset: {{ forecast.astro.sunset }}</p>
  </div>

</template>

<script>
import {Forecast} from "@/constants";

export default {
  name: "ForecastCell",

  props: {
    forecast: {
      type: Forecast
    }
  },

  computed: {
    img() {
      return `https://${this.forecast.day.condition.icon}`
    }
  }
}
</script>

<style scoped>
.cell {
  background-color: aliceblue;
  padding: 10px;
  text-align: left;
  margin: 10px;
  width: 200px;
  border-radius: 10px;
}
</style>