<template>
  <div class="forecast_today" v-if="forecast">
    <div class="forecast_today_item">
      <h2>{{ forecast.location.name }}</h2>
      <p><label>{{ forecast.location.country }}</label></p>
      <div> {{ forecast.current.temp_c }} ° C</div>
    </div>
    <div class="forecast_today_item">
      <img :src="img" alt="" style="width: 100px">
    </div>
  </div>
</template>

<script>
export default {
  name: "ForecastToday",

  props: {
    forecast: {
      type: Object,
      required: false
    }
  },

  computed: {
    img() {
      return `https://${this.forecast.current.condition.icon}`
    }
  }
}


</script>

<style scoped>
* {
  background: #dadff9;
}

.forecast_today {
  border-radius: 10px;
  padding: 10px;
  font-size: 24px;
}

.forecast_today_item {
  display: inline-block;
}
</style>