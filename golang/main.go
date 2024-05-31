package main

import (
	"fmt"
	"os"
	"slices"
	"strings"
	"unicode"
)

/*
Text
Text Editor 			- Notepad style application that can open, edit, and save text documents. Optional: Add syntax highlighting and other features.
RSS Feed Creator 		- Given a link to RSS/Atom Feed, get all posts and display them.
Quote Tracker 			- A program which can go out and check the current value of stocks for a list of symbols entered by the user. The user can set how often the stocks are checked. For CLI, show whether the stock has moved up or down. Optional: If GUI, the program can show green up and red down arrows to show which direction the stock value has moved.
Guestbook/Journal 		- A simple application that allows people to add comments or write journal entries. It can allow comments or not and timestamps for all entries. Could also be made into a shout box. Optional: Deploy it on Google App Engine or Heroku or any other PaaS (if possible, of course).
Vernam/Ceasar Ciphers 	- Functions for encrypting and decrypting data messages. Then send them to a friend.
Regex Query Tool 		- A tool that allows the user to enter a text string and then in a separate control enter a regex pattern. It will run the regular expression against the source text and return any matches or flag errors in the regular expression.
*/

func main() {
	fmt.Println("Hello Go String Manipulation!")
	// fizzBuzz()
	// reverseString("The quick brown fox jumps over the lazy สุนัข")
	// pigLatin("the quick brown fox")
	// countVowels("The quick brown fox jumps over the lazy dog.")
	// checkPalindrome("racecar")
	// countWordsInString("example.txt")
}

func removePunctuationFromString(file string) string {
	result := ""
	for _, c := range file {
		ch := rune(c)
		validChar := unicode.IsLetter(ch) || ch == '\'' || ch == ' ' || ch == '\n'
		if validChar {
			result += string(c)
		}
	}
	return result
}

func countWordsInString(path string) {
	file, err := os.ReadFile(path)
	if err != nil {
		fmt.Println("Error reading file:", err)
		return
	}
	result := make(map[string]int)
	fileStr := strings.ToLower(string(file))
	noPunc := removePunctuationFromString(fileStr)
	lines := strings.Split(noPunc, "\n")
	var allWords []string
	for _, line := range lines {
		words := strings.Split(line, " ")
		for _, word := range words {
			allWords = append(allWords, word)
			if _, ok := result[word]; ok {
				result[word] += 1
			} else {
				result[word] = 1
			}
		}
	}
	fmt.Println("Text summary:")
	for k, v := range result {
		if v == 1 {
			fmt.Printf("The word '%s' occurs 1 time.\n", k)
		} else {
			fmt.Printf("The word '%s' occurs %d times.\n", k, v)
		}
	}
	fmt.Printf("There were a total of %d distinct words in the text.\n", len(result))
}

func checkPalindrome(text string) {
	reversedString := []rune(text)
	original := make([]rune, len(reversedString))
	copy(original, reversedString)
	slices.Reverse(reversedString)
	for i := range len(original) {
		if original[i] != reversedString[i] {
			fmt.Println("Not a palindrome.")
			return
		}
	}
	fmt.Println("Palindrome!")
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
	chars := []rune(str)
	temp := make([]rune, len(chars))
	for i, c := range chars {
		temp[i] = c
	}
	slices.Reverse(temp)
	reversedString := string(temp)
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
