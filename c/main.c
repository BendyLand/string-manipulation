#include <stdio.h>
#include <stdbool.h>
#include <string.h>


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


void reverseString(char[]);
void pigLatin(char word[]);
void countVowels(char word[]);

int main(void) {
    // printf("Hello C String Manipulation!\n");

    // reverseString("The quick brown fox jumps over the lazy dog.");
    // pigLatin("thanks");
    // countVowels("The quick brown fox jumps over the lazy dog.");

    return 0;
}

// Count Vowels	- Enter a string and the program counts the number of vowels in the text. For added complexity have it report a sum of each vowel found.
void countVowels(char word[]) {
    const char VOWELS[] = "aeiouAEIOU";
    int numVowels = 0;
    for (int i = 0; i < strlen(word); i++) {
        if (strchr(VOWELS, word[i]) != NULL) {
            numVowels++;
        }
    }
    printf("There were %d vowels in the text!\n", numVowels);
}


// Pig Latin - Pig Latin is a game of alterations played on the English language game. To create the Pig Latin form of an English word the initial consonant sound is transposed to the end of the word and an ay is affixed (Ex.: "banana" would yield anana-bay). Read Wikipedia for more information on rules.
void pigLatin(char word[]) {
    const char VOWELS[] = "aeiou";
    char* newWord;

    bool startsWithVowel = strchr(VOWELS, word[0]) != NULL;
    bool startsWithOneConsonant = strchr(VOWELS, word[0]) == NULL;
    bool startsWithTwoConsonants = strchr(VOWELS, word[1]) == NULL && startsWithOneConsonant;
    if (startsWithVowel) {
        printf("%sway\n", word);
    }
    else if (startsWithTwoConsonants) {
        char firstTwoLetters[3];
        sprintf(firstTwoLetters, "%c%c", word[0], word[1]);
        char remainingLetters[strlen(word)-2];
        strcpy(remainingLetters, &word[2]);
        printf("%s%say\n", remainingLetters, firstTwoLetters);
    }
    else {
        char newWord[strlen(word)];
        strcpy(newWord, &word[1]);
        printf("%s%cay", newWord, word[0]);
    }
}

// Reverse a String - Enter a string and the program will reverse it and print it out.
void reverseString(char word[]) {
    int length = strlen(word);
    char newWord[length];
    int j = 0;
    for (int i = strlen(word)-1; i >= 0; i--) {
        newWord[j] = word[i];
        j++;
    }
    printf("%s", newWord);
}
