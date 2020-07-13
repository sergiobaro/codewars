package src.test

import countthedigit.countDigit
import countthedigit.nbDig
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class CountTheDigitKtTest {

    @Test fun test_first() {
        assertEquals(nbDig(10, 1), 4)
    }

    @Test fun test_second() {
        assertEquals(nbDig(25, 1), 11)
    }

    @Test
    fun test() {
        assertEquals(nbDig(5750, 0), 4700)
        assertEquals(nbDig(11011, 2), 9481)
    }

    @Test
    fun test_countDigit() {
        assertEquals(countDigit(2, 1), 0)
        assertEquals(countDigit(1, 1), 1)
        assertEquals(countDigit(111, 1), 3)
    }

    @Test
    fun test_countDigit_zero() {
        assertEquals(countDigit(100, 0), 2)
        assertEquals(countDigit(0, 0), 1)
    }
}