package encryptthis

fun encryptThis(text: String): String {
    return text.split(" ")
            .map { encryptWord(it) }
            .joinToString(" ")
}

fun encryptWord(word: String): String {
    return word.mapIndexed { i, char ->
        when (i) {
            0 -> char.toInt().toString()
            1 -> word.last().toString()
            word.lastIndex -> word[1].toString()
            else -> char.toString()
        }
    }.joinToString("")
}