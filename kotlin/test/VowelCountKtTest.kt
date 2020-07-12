package src.test

import org.junit.jupiter.api.Test
import vowelcount.getCount
import kotlin.test.assertEquals

internal class VowelCountKtTest {

    @Test
    fun testFixed() {
        assertEquals(0, getCount(""))
        assertEquals(0, getCount("b"))
        assertEquals(5, getCount("abracadabra"))
        assertEquals(1, getCount("test"))
        assertEquals(3, getCount("example"))
    }
}