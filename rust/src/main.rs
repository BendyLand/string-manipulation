/*
Text
Count Words in a String - Counts the number of individual words in a string. For added complexity read these strings in from a text file and generate a summary.
Text Editor 			- Notepad style application that can open, edit, and save text documents. Optional: Add syntax highlighting and other features.
RSS Feed Creator 		- Given a link to RSS/Atom Feed, get all posts and display them.
Quote Tracker 			- A program which can go out and check the current value of stocks for a list of symbols entered by the user. The user can set how often the stocks are checked. For CLI, show whether the stock has moved up or down. Optional: If GUI, the program can show green up and red down arrows to show which direction the stock value has moved.
Guestbook/Journal 		- A simple application that allows people to add comments or write journal entries. It can allow comments or not and timestamps for all entries. Could also be made into a shout box. Optional: Deploy it on Google App Engine or Heroku or any other PaaS (if possible, of course).
Vernam/Ceasar Ciphers 	- Functions for encrypting and decrypting data messages. Then send them to a friend.
Regex Query Tool 		- A tool that allows the user to enter a text string and then in a separate control enter a regex pattern. It will run the regular expression against the source text and return any matches or flag errors in the regular expression.
*/

fn main() {
    reverse_string("The quick brown fox".to_string());
    test_pig_latin();
    count_vowels("The quick brown fox jumps over the lazy dog".to_string());
    test_check_palindrome();
}

fn check_palindrome(text: &mut String) {
    let reversed = {
        text
            .chars()
            .map(|c| c.to_ascii_lowercase())
            .rev()
            .collect::<String>()
    };
    let original = text.to_ascii_lowercase().to_string();
    if original == reversed {
        println!("The word '{}' is a palindrome!", text);
    }
    else {
        println!("The word '{}' is not a palindrome!", text);
    }
}

fn test_check_palindrome() {
    check_palindrome(&mut "Noxon".to_string());
    check_palindrome(&mut "years".to_string());
}

fn count_vowels(text: String) {
    let vowels = "aeiouAEIOU";
    let mut num_vowels = 0;
    for c in text.chars() {
        if vowels.contains(c) {
            num_vowels += 1;
        }
    }
    println!("There were {} vowels in the text!", num_vowels);
}

fn pig_latin(word: String) {
    let vowels = "aeiouAEIOU";
    let starts_with_vowel = vowels.contains(&&word[0..1]);
    let two_consonants = !vowels.contains(&&word[1..2]) && !starts_with_vowel;
    if starts_with_vowel {
        println!("{}way", &word);
    }
    else if two_consonants {
        let first_two = &word[..=1];
        let remaining_chars = &word[2..];
        println!("{}{}ay", remaining_chars, first_two);
    }
    else {
        let body = &word[1..];
        println!("{}{}ay", body, &word[0..1]);
    }
}

fn test_pig_latin() {
    pig_latin("idea".to_string());
    pig_latin("this".to_string());
    pig_latin("task".to_string());
}

// Reverse a String	- Enter a string and the program will reverse it and print it out.
fn reverse_string(text: String) {
    let new_str = {
        text
            .chars()
            .rev()
            .map(|c| c.to_string())
            .collect::<Vec<String>>()
            .join("")
    };
    println!("Original: {}\nReversed: {}", &text, &new_str);
}
