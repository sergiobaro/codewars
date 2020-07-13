package bus

fun main(args: Array<String>) {

}

fun people(busStops: Array<Pair<Int, Int>>): Int {
    return busStops.fold(0) { total, pair -> total + pair.first - pair.second }
}