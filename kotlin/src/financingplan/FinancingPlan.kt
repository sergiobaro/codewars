package financingplan

import java.math.BigInteger

object Finance {

    fun finance(n: Int): BigInteger {
        var first = 0
        var last = n
        var total = sum(first, last, n + 1)
        var number = n

        while (number > 0) {
            first += 2
            last += 1
            total += sum(first, last, number)

            number -= 1
        }

        return BigInteger.valueOf(total)
    }

    fun sum(first: Int, last: Int, number: Int): Long {
        return (0.5 * (first + last) * number).toLong()
    }
}