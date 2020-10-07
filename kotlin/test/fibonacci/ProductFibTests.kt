package src.test.fibonacci

import fibonacci.fib
import fibonacci.productFib
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class ProductFibTests {

    @Test
    fun testFibonacci() {
        assertEquals(0, fib(0))
        assertEquals(1, fib(1))
        assertEquals(1, fib(2))
    }

    @Test
    fun testFibonacciThree() {
        assertEquals(2, fib(3))
    }

    @Test
    fun testFibonacciFour() {
        assertEquals(3, fib(4))
    }

    @Test
    fun testFibonacciFive() {
        assertEquals(5, fib(5))
    }

    @Test
    fun testProductFibZero() {
        assertArrayEquals(longArrayOf(0, 1, 1), productFib(0))
    }

    @Test
    fun testProductFibOne() {
        assertArrayEquals(longArrayOf(1, 1, 1), productFib(1))
    }

    @Test
    fun testProductFibTwo() {
        assertArrayEquals(longArrayOf(1, 2, 1), productFib(2))
    }

    @Test
    fun testProductFibThree() {
        assertArrayEquals(longArrayOf(2, 3, 0), productFib(3))
    }

    @Test
    fun testProductFibFour() {
        assertArrayEquals(longArrayOf(2, 3, 0), productFib(4))
    }

    @Test
    fun testProductFibFive() {
        assertArrayEquals(longArrayOf(2, 3, 0), productFib(5))
    }

    @Test
    fun testProductFibSix() {
        assertArrayEquals(longArrayOf(2, 3, 1), productFib(6))
    }

    @Test
    fun test1() {
        val r = longArrayOf(55, 89, 1)
        assertArrayEquals(r, productFib(4895))
    }
    @Test
    fun test2() {
        val r = longArrayOf(89, 144, 0)
        assertArrayEquals(r, productFib(5895))
    }
}