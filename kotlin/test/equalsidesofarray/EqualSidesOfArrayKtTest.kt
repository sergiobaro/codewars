package src.test.equalsidesofarray

import equalsidesofarray.findEvenIndex
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test

internal class EqualSidesOfArrayKtTest {

    @Test
    fun test_emptyArray() {
        assertEquals(-1, findEvenIndex(intArrayOf()))
    }

    @Test
    fun test_zeroIndex() {
        assertEquals(0, findEvenIndex(intArrayOf(20,10,-80,10,10,15,35)))
    }

    @Test
    fun test_firstIndex() {
        assertEquals(1, findEvenIndex(intArrayOf(1, 100, 50, -51, 1, 1)))
    }

    @Test
    fun test_middleIndex() {
        assertEquals(3, findEvenIndex(intArrayOf(1, 2, 3, 4, 3, 2, 1)))
    }

    @Test
    fun test_notFound() {
        assertEquals(-1, findEvenIndex(intArrayOf(1, 2, 3, 4, 5, 6)))
    }

    @Test
    fun test() {
        assertEquals(1, findEvenIndex(intArrayOf(1, 100, 50, -51, 1, 1)))
        assertEquals(3, findEvenIndex(intArrayOf(20, 10, 30, 10, 10, 15, 35)))
        assertEquals(-1, findEvenIndex(intArrayOf(-8505, -5130, 1926, -9026)))
        assertEquals(1, findEvenIndex(intArrayOf(2824, 1774, -1490, -9084, -9696, 23094)))
        assertEquals(6, findEvenIndex(intArrayOf(4, 5, 6, 7, 8, 9, 10, 9, 8, 7, 6, 5, 4)))
    }
}