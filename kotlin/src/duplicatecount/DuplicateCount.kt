package duplicatecount

fun main(args: Array<String>) {
    duplicateCount("aaa")
}

fun duplicateCount(text: String): Int {
    val chars = mutableSetOf<Char>()
    val duplicatedChars = mutableSetOf<Char>()

    text.toLowerCase().forEach {
        if (chars.contains(it)) {
            duplicatedChars.add(it)
        }
        chars.add(it)
    }

    return duplicatedChars.size
}