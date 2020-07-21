package src.test.financingplan

import financingplan.Finance
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.math.BigInteger

internal class NumberOfPeopleInABusKtTest {

    @Test
    fun zero() {
        assertEquals(BigInteger.valueOf(0), Finance.finance(0))
    }

    @Test
    fun one() {
        assertEquals(BigInteger.valueOf(3), Finance.finance(1))
    }

    @Test
    fun basicTests() {
        assertEquals(BigInteger.valueOf(105), Finance.finance(5))
        assertEquals(BigInteger.valueOf(168), Finance.finance(6))
        assertEquals(BigInteger.valueOf(252), Finance.finance(7))
        assertEquals(BigInteger.valueOf(62537505000), Finance.finance(5000))
    }
}
