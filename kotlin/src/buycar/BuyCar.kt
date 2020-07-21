package buycar

import kotlin.math.roundToInt

object BuyCar {
    fun nbMonths(
            startPriceOld: Int,
            startPriceNew: Int,
            savingPerMonth: Int,
            percentLossByMonth: Double
    ): Pair<Int, Int> {
        var priceOld = startPriceOld.toDouble()
        var priceNew = startPriceNew.toDouble()
        var savings = 0.0
        var percentLoss = percentLossByMonth
        var month = 0
        var available = priceOld - priceNew

        while (available < 0) {
            month++
            if (month % 2 == 0) percentLoss += 0.5
            priceOld = priceOld * ((100 - percentLoss) / 100)
            priceNew = priceNew * ((100 - percentLoss) / 100)
            savings += savingPerMonth

            available = (priceOld + savings) - priceNew
        }

        return month.toInt() to available.roundToInt()
    }
}

fun main(args: Array<String>) {
    BuyCar.nbMonths(2000, 8000, 1000, 1.5)
}