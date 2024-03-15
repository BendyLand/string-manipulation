package main

import (
	"fmt"
	"slices"
	"strings"
)

/*
Text
Check if Palindrome 	- Checks if the string entered by the user is a palindrome. That is that it reads the same forwards as backwards like “racecar”
Count Words in a String - Counts the number of individual words in a string. For added complexity read these strings in from a text file and generate a summary.
Text Editor 			- Notepad style application that can open, edit, and save text documents. Optional: Add syntax highlighting and other features.
RSS Feed Creator 		- Given a link to RSS/Atom Feed, get all posts and display them.
Quote Tracker 			- A program which can go out and check the current value of stocks for a list of symbols entered by the user. The user can set how often the stocks are checked. For CLI, show whether the stock has moved up or down. Optional: If GUI, the program can show green up and red down arrows to show which direction the stock value has moved.
Guestbook/Journal 		- A simple application that allows people to add comments or write journal entries. It can allow comments or not and timestamps for all entries. Could also be made into a shout box. Optional: Deploy it on Google App Engine or Heroku or any other PaaS (if possible, of course).
Vernam/Ceasar Ciphers 	- Functions for encrypting and decrypting data messages. Then send them to a friend.
Regex Query Tool 		- A tool that allows the user to enter a text string and then in a separate control enter a regex pattern. It will run the regular expression against the source text and return any matches or flag errors in the regular expression.
*/

func main() {
	// fizzBuzz()
	// reverseString("The quick brown fox jumps over the lazy dog.")
	// pigLatin("the quick brown fox")
	// countVowels("The quick brown fox jumps over the lazy dog.")
}

type List []string

func (l List) Contains(c rune) bool {
	for _, x := range l {
		if x == string(c) {
			return true
		}
	}
	return false
}

type MyString string

func (s MyString) FilterChars(chars string) []string {
	var resultList []string
	var vowels List = strings.Split("aeiou", "")
	for _, c := range s {
		if vowels.Contains(c) {
			resultList = append(resultList, string(c))
		}
	}
	return resultList
}

func countVowels(text string) {
	text = strings.ToLower(text)
	myText := MyString(text)
	vowels := "aeiou"
	vowelsInString := myText.FilterChars(vowels)
	fmt.Printf("There are %d vowels in thr provided text!\n", len(vowelsInString))
}

func pigLatin(sentence string) {
	words := strings.Split(sentence, " ")
	for _, word := range words {
		pigLatinWord(word)
	}
	fmt.Println()
}

func pigLatinWord(word string) {
	var vowels, consonants List
	word = strings.ToLower(word)
	vowels = strings.Split("aeiou", "")
	consonants = strings.Split("bcdfghjklmnpqrstvwxyz", "")
	oneConsonant := consonants.Contains(rune(word[0]))
	twoConsonants := consonants.Contains(rune(word[0])) && consonants.Contains(rune(word[1]))
	if vowels.Contains(rune(word[0])) {
		fmt.Print(word + "way ")
	} else if twoConsonants {
		body := word[2:]
		head := word[:2]
		fmt.Print(body + head + "ay ")
	} else if oneConsonant {
		body := word[1:]
		head := string(word[0])
		fmt.Print(body + head + "ay ")
	} else {
		fmt.Print("You shouldn't be here!")
	}
}

func reverseString(str string) {
	temp := make([]string, len(str))
	for i, c := range str {
		temp[i] = string(c)
	}
	slices.Reverse(temp)
	reversedString := strings.Join(temp, "")
	fmt.Println(reversedString)
}

func fizzBuzz() {
	for i := range 101 {
		divisibleBy3 := i%3 == 0
		divisibleBy5 := i%5 == 0
		divisibleByBoth := divisibleBy3 && divisibleBy5
		switch {
		case divisibleByBoth:
			fmt.Println("FizzBuzz")
		case divisibleBy5:
			fmt.Println("Buzz")
		case divisibleBy3:
			fmt.Println("Fizz")
		default:
			fmt.Println(i)
		}
	}
}
