package src.test

import encryptthis.encryptThis
import encryptthis.encryptWord
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class EncryptThisKtTest {

    @Test
    fun testSample() {
        // Example Test Cases
        assertEquals("65 119esi 111dl 111lw 108dvei 105n 97n 111ka", encryptThis("A wise old owl lived in an oak"))
        assertEquals("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp", encryptThis("The more he saw the less he spoke"))
        assertEquals("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare", encryptThis("The less he spoke the more he heard"))
        assertEquals("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri", encryptThis("Why can we not all be like that wise old bird"))
        assertEquals("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple", encryptThis("Thank you Piotr for all your help"))
    }

    @Test
    fun encryptWord_lenghtOne() {
        assertEquals("65", encryptWord("A"))
    }

    @Test
    fun encryptWord_lengthTwo() {
        assertEquals("104e", encryptWord("he"))
    }

    @Test
    fun encryptWord_lengthThree() {
        assertEquals("111ka", encryptWord("oak"))
    }

    @Test
    fun encryptWord_lengthFour() {
        assertEquals("119esi", encryptWord("wise"))
    }
}