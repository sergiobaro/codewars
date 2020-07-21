package src.test.decodemorse

import decodemorse.decodeMorse
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class DecodeMorseKtTest {

    @Test
    fun simpleCase() {
        assertEquals("A", decodeMorse(".-"))
    }

    @Test
    fun ignoreHeadingAndTrailingSpaces() {
        assertEquals("E", decodeMorse(" . "))
    }
    @Test
    fun exampleTestCases() {
        assertEquals("HEY JUDE", decodeMorse(".... . -.--   .--- ..- -.. ."))
    }
}