fun toRedisDate(dwDate) = dwDate as DateTime as Number {unit: "milliseconds"}
fun fromRedisDate(redisDate) = redisDate as Number as DateTime {unit: "milliseconds"}
fun toUnixTime(dwDate) = dwDate as Number {unit: "seconds"}
fun fromUnixTime(redisDate) = redisDate as DateTime {unit: "seconds"}

fun adjustToMidnightPacific(ts: DateTime) = do {
	var atMidnight = "T00:00:00"
	var adjustedToMidnightString = ts as String { format: "yyyy-MM-dd" } ++ atMidnight
	var pacificZone = "US/Pacific" as TimeZone
	---
	(adjustedToMidnightString ++ pacificZone) as DateTime
}

fun tomorrowAtMidnight() = adjustToMidnightPacific(now() + |P1D|)

fun nextSundayMidnight() = do {
	var weekdayNum = now() as String {format: "e"} as Number
	var nextSunday = now() - ("P$(weekdayNum)D" as Period) + |P8D|
	---
	adjustToMidnightPacific(nextSunday)
}
