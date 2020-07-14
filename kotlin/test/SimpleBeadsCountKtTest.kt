package src.test

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import simplebeadscount.countRedBeads

internal class SimpleBeadsCountKtTest {

    @Test
    fun testFixed() {
        assertEquals(0, countRedBeads(0));
        assertEquals(0, countRedBeads(1));
        assertEquals(4, countRedBeads(3));
        assertEquals(8, countRedBeads(5));
    }
}