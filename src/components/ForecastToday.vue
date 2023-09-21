<template>
  <div class="forecast" v-if="forecast">
    <h2>Today</h2>
    <img :src="img" alt="">
      <p><label>City: {{ forecast.location.name }}</label></p>
      <p><label>Country: {{ forecast.location.country }}</label></p>
      <p><label>Temperature: {{ forecast.current.temp_c }} ° C</label></p>
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
.forecast {
  background-color: #dadff9;
  border-radius: 10px;
  padding: 10px;
  text-align: left;
}
</style>