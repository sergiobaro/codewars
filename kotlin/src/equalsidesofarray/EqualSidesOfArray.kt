package equalsidesofarray

fun findEvenIndex(arr: IntArray): Int {
    if (arr.size == 0) return -1

    var rightSide = arr.sum() - arr[0]
    var leftSize = 0
    var index = 1

    while (rightSide != leftSize && index < arr.size) {
        rightSide -= arr[index]
        leftSize += arr[index - 1]
        index++
    }

    return if (rightSide == leftSize) index -1 else -1
}