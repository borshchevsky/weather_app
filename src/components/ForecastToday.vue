<template>
  <div v-if="forecast">
      <p><label>City: {{ forecast.location.name }}</label></p>
      <p><label>Country: {{ forecast.location.country }}</label></p>
      <p><label>Temperature: {{ forecast.current.temp_c }}</label></p>
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
  }
}

</script>

<style scoped>

</style>