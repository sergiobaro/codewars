package meeting

import java.lang.StringBuilder

fun meeting(s: String): String {
    return s.toUpperCase()
            .split(";")
            .map { it.split(":") }
            .map { "(${it[1]}, ${it[0]})" }
            .sorted()
            .joinToString("")
}