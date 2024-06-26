const std = @import("std");
const stdout = std.io.getStdOut().writer();
const Allocator = std.mem.Allocator;

// Text
// Check if Palindrome 	- Checks if the string entered by the user is a palindrome. That is that it reads the same forwards as backwards like “racecar”
// Count Words in a String - Counts the number of individual words in a string. For added complexity read these strings in from a text file and generate a summary.
// Text Editor 			- Notepad style application that can open, edit, and save text documents. Optional: Add syntax highlighting and other features.
// RSS Feed Creator 		- Given a link to RSS/Atom Feed, get all posts and display them.
// Quote Tracker 			- A program which can go out and check the current value of stocks for a list of symbols entered by the user. The user can set how often the stocks are checked. For CLI, show whether the stock has moved up or down. Optional: If GUI, the program can show green up and red down arrows to show which direction the stock value has moved.
// Guestbook/Journal 		- A simple application that allows people to add comments or write journal entries. It can allow comments or not and timestamps for all entries. Could also be made into a shout box. Optional: Deploy it on Google App Engine or Heroku or any other PaaS (if possible, of course).
// Vernam/Ceasar Ciphers 	- Functions for encrypting and decrypting data messages. Then send them to a friend.
// Regex Query Tool 		- A tool that allows the user to enter a text string and then in a separate control enter a regex pattern. It will run the regular expression against the source text and return any matches or flag errors in the regular expression.

pub fn main() !void {
    try stdout.print("Hello Zig String Manipulation!\n", .{});
    const allocator = std.heap.page_allocator;

    const buffer = "This is a test";
    try reverse_string(&allocator, buffer[0..]);

    var word: []const u8 = "idea"; try pig_latin(word[0..]);
    word = "this"; try pig_latin(word[0..]); 
    word = "take"; try pig_latin(word[0..]);

    const string = "The quick brown fox jumps over the lazy dog.";
    try count_vowels(string);
}

// Count Vowels - Enter a string and the program counts the number of vowels in the text. For added complexity have it report a sum of each vowel found.
pub fn count_vowels(text: []const u8) !void {
    const vowels = "aeiouAEIOU";
    var num_vowels: u8 = 0;
    for (text) |c| {
        if (std.mem.indexOfScalar(u8, vowels, c) != null) {
            num_vowels += 1;
        }
    }
    try stdout.print("There were {d} vowels in the text.\n", .{num_vowels});
}

// Pig Latin - Pig Latin is a game of alterations played on the English language game. To create the Pig Latin form of an English word the initial consonant sound is transposed to the end of the word and an ay is affixed (Ex.: "banana" would yield anana-bay). Read Wikipedia for more information on rules.
pub fn pig_latin(text: []const u8) !void {
    const vowels = "aeiouAEIOU";

    const startsWithVowel = std.mem.indexOfScalar(u8, vowels, text[0]) != null;
    const oneConsonant = std.mem.indexOfScalar(u8, vowels, text[0]) == null;
    const twoConsonants = std.mem.indexOfScalar(u8, vowels, text[1]) == null and oneConsonant;
    if (startsWithVowel) {
        try stdout.print("{s}way\n", .{text});
    }
    else if (twoConsonants) {
        const firstTwo = text[0..2];
        const remainingChars = text[2..];
        try stdout.print("{s}{s}ay\n", .{remainingChars, firstTwo});
    }
    else {
        const remainingChars = text[1..];
        try stdout.print("{s}{c}ay\n", .{remainingChars, text[0]});
    }
}

// Reverse a String	- Enter a string and the program will reverse it and print it out.
pub fn reverse_string(a: *const Allocator, text: []const u8) !void {
    const buffer: []u8 = try a.alloc(u8, text.len);
    defer a.free(buffer);
    std.mem.copy(u8, buffer, text);
    std.mem.reverse(u8, buffer);
    try stdout.print("Original: {s}\nReversed: {s}\n", .{text, buffer});
}