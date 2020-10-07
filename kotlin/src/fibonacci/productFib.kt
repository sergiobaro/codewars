package fibonacci

fun fib(target: Long): Long {
    if (target <= 0) {
        return 0L
    }

    var x1: Long = 0
    var x2: Long = 1
    for (i in 2..target) {
        val tmp = x2
        x2 = x1 + x2
        x1 = tmp
    }

    return x2
}

fun productFib(prod: Long): LongArray {
    var currentProd = 0L
    var x1 = 0L
    var x2 = 1L

    while (currentProd < prod) {
        x1 = x2.also { x2 += x1 }
        currentProd = x1 * x2
    }

    val found = if (currentProd == prod) 1L else 0L
    return longArrayOf(x1, x2, found)
}