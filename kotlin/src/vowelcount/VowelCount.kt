package vowelcount

fun main(args: Array<String>) {
    println(getCount("test"))
}

fun getCount(str: String): Int = str.count { it in "aeiou" }