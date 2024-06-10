package main

import "core:fmt"
import "core:strings"

/* 
Text
Text Editor 			- Notepad style application that can open, edit, and save text documents. Optional: Add syntax highlighting and other features.
RSS Feed Creator 		- Given a link to RSS/Atom Feed, get all posts and display them.
Quote Tracker 		- A program which can go out and check the current value of stocks for a list of symbols entered by the user. The user can set how often the stocks are checked. For CLI, show whether the stock has moved up or down. Optional: If GUI, the program can show green up and red down arrows to show which direction the stock value has moved.
Guestbook/Journal 	- A simple application that allows people to add comments or write journal entries. It can allow comments or not and timestamps for all entries. Could also be made into a shout box. Optional: Deploy it on Google App Engine or Heroku or any other PaaS (if possible, of course).
Vernam/Ceasar Ciphers - Functions for encrypting and decrypting data messages. Then send them to a friend.
Regex Query Tool 		- A tool that allows the user to enter a text string and then in a separate control enter a regex pattern. It will run the regular expression against the source text and return any matches or flag errors in the regular expression.
*/

main :: proc() {
    fizzbuzz()
    test_reverse()
    pig_latin("here is my final test")
    count_vowels("the quick brown fox jumps over the lazy dog.")
    test_palindrome()
}

fizzbuzz :: proc() {
    for i in 1..=100 {
        if i % 5 == 0 && i % 3 == 0 {
            fmt.println("FizzBuzz")
        }
        else if i % 5 == 0 {
            fmt.println("Buzz")
        }
        else if i % 3 == 0 {
            fmt.println("Fizz")
        }
        else {
            fmt.println(i)
        }
    }
}

reverse :: proc(s: string) -> string {
    return strings.reverse(s)
}
test_reverse :: proc() {
    s := "Hi Odin!"
    fmt.println(s)
    fmt.println(reverse(s))
}

pig_latin :: proc(s: string) {
    vowels := "aeiouyAEIOUY"
    result: string
    words := strings.split(s, " ")
    new_words: [dynamic]string
    for word, i in words {
        if strings.contains_rune(vowels, rune(word[0])) {
            result = strings.concatenate([]string{word, "way"})
            append(&new_words, result)
            result = ""
        }
        else if !strings.contains_rune(vowels, rune(word[1])) {
            result = strings.concatenate([]string{word[2:], word[:2], "ay"})
            append(&new_words, result)
            result = ""
        }
        else {
            result = strings.concatenate([]string{word[1:], word[0:1], "ay"})
            append(&new_words, result)
            result = ""
        }
    }
    result = strings.join(new_words[:], " ")
    fmt.println(result)
}

count_vowels :: proc(s: string) {
    vowels := "aeiouAEIOU"
    count := 0
    for c in s {
        if strings.contains_rune(vowels, c) {
            count += 1
        }
    }
    fmt.printf("There were %d vowels in the text!\n", count)
}

check_palindrome :: proc(s: string) {
    s1 := strings.to_lower(s)
    rev := strings.reverse(s1)
    is_palindrome := false
    if s1 == rev {
        is_palindrome = true
    }
    if is_palindrome {
        fmt.println(s, "is a palindrome!")
    }
    else {
        fmt.println(s, "is not a palindrome.")
    }
}
test_palindrome :: proc() {
    check_palindrome("Noxon")
    check_palindrome("racecar")
    check_palindrome("Ben")
}

// Count Words in a String - Counts the number of individual words in a string. For added complexity read these strings in from a text file and generate a summary.
