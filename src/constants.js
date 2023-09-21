export const apiKey = '5c0e6e1f70da4612b9565848231509'
export const apiUrl = 'https://api.weatherapi.com/v1'

export class Forecast {
    constructor(date, day, astro) {
        this.date = date
        this.day = day
        this.astro = astro
    }
}
