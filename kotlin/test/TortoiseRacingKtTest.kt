package src.test

import org.junit.jupiter.api.Test
import tortoiseracing.race
import org.junit.jupiter.api.Assertions.assertArrayEquals

internal class TortoiseRacingKtTest {

    @Test
    fun testFixed() {
        assertArrayEquals(intArrayOf(), race(20, 10, 0))
        assertArrayEquals(intArrayOf(0, 32, 18), race(720, 850, 70))
        assertArrayEquals(intArrayOf(3, 21, 49), race(80, 91, 37))
    }
}