<template>
  <div class="forecast" v-for="day in forecastList" :key="day.date">
      <ForecastCell :forecast="day"/>
  </div>
</template>

<script>
import {Forecast} from "@/constants";
import ForecastCell from "@/components/ForecastCell";

export default {
  name: "ForecastList",
  components: {
    ForecastCell
  },

  props: {
    forecast: {
      type: Array
    }
  },

  computed: {
    forecastList() {
      let list = []
      for (let item of this.forecast.slice(1)) {
        list.push(new Forecast(new Date(item.date), item.day, item.astro))
      }
      return list
    }
  }
}
</script>

<style scoped>
  .forecast {
    display: inline-block;
  }
</style>