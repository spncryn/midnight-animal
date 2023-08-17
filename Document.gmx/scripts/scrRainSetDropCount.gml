if argument0 <= 0 or argument0 > 5000 return 0;

with objRain {
    var diff = argument0 - rain_drops;
    rain_drops = argument0;
    rain[rain_drops*2] = 0
    if diff > 0 {
        for (var i = (rain_drops - diff)*2; i< rain_drops * 2; i+=2) { 
            rain[i] = random_range(x - rain_range, x + rain_range)
            rain[i+1] = y - random(50); 
        }
    }
}
