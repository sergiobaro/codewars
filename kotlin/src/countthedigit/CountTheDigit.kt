package countthedigit

fun main(args: Array<String>) {

    println(countDigit(1, 1))
}

fun nbDig(n: Int, d: Int): Int {
    return (0..n)
            .map { it * it }
            .fold(0) { result, element -> result + countDigit(element, d) }
}

fun countDigit(n: Int, d: Int): Int {
    if (n == 0 && d == 0) return 1

    var result = 0

    var number = n
    while (number > 0) {
        if (number % 10 == d) {
            result++
        }
        number = number / 10
    }
    return result
}