package tortoiseracing

fun main(args: Array<String>) {
    println(race(720, 850, 70).joinToString())
}

fun race(v1: Int, v2: Int, g: Int): IntArray {
    if (v1 >= v2) return intArrayOf()

    val timeInSeconds = (g * 60 * 60) / (v2 - v1)
    val hours = timeInSeconds / 3600
    val minutes = (timeInSeconds / 60) % 60
    val seconds = timeInSeconds % 60 % 60

    return intArrayOf(hours, minutes, seconds)
}