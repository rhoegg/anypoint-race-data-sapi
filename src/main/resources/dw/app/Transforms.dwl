fun toRedisDate(dwDate) = dwDate as DateTime as Number {unit: "milliseconds"}
fun fromRedisDate(redisDate) = redisDate as Number as DateTime {unit: "milliseconds"}