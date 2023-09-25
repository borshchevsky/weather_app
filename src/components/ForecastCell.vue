<template>
  <div class="cell">
    <h3>
      <strong>
        {{
          forecast.date.toLocaleDateString('en-EN', {
            day: 'numeric',
            month: 'short'
          })
        }}
      </strong>
    </h3>
    <p>
      <img :src="img" alt="">
    </p>
    <p>Min temp: {{ forecast.day.mintemp_c }} ° C</p>
    <p>Max temp: {{ forecast.day.maxtemp_c }} ° C</p>
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
* {
  background: aliceblue;
}

p {
  margin: 5px 0;
}

.cell {
  padding: 10px;
  text-align: left;
  width: 200px;
  border-radius: 10px;
  font-family: 'NOCTADO', sans-serif;
}
</style>