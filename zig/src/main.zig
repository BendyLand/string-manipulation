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

    var buffer = "This is a test";
    try reverseString(&allocator, buffer[0..]);

    var newBuffer = "idea"; try pigLatin(newBuffer[0..]);
    newBuffer = "this";     try pigLatin(newBuffer[0..]); // reassignments need to be the same length...
    newBuffer = "take";     try pigLatin(newBuffer[0..]);


}

// Count Vowels 			- Enter a string and the program counts the number of vowels in the text. For added complexity have it report a sum of each vowel found.


// Pig Latin - Pig Latin is a game of alterations played on the English language game. To create the Pig Latin form of an English word the initial consonant sound is transposed to the end of the word and an ay is affixed (Ex.: "banana" would yield anana-bay). Read Wikipedia for more information on rules.
pub fn pigLatin(text: []const u8) !void {
    const vowels = "aeiouAEIOU";

    const startsWithVowel = std.mem.indexOf(u8, vowels, text[0..1]) != null;
    const startsWithOneConsonant = std.mem.indexOf(u8, vowels, text[0..1]) == null;
    const startsWithTwoConsonants = std.mem.indexOf(u8, vowels, text[1..2]) == null and startsWithOneConsonant;
    if (startsWithVowel) {
        try stdout.print("{s}way\n", .{text});
    }
    else if (startsWithTwoConsonants) {
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
pub fn reverseString(a: *const Allocator, text: []const u8) !void {
    var buffer: []u8 = try a.alloc(u8, text.len);
    defer a.free(buffer);
    std.mem.copy(u8, buffer, text);
    std.mem.reverse(u8, buffer);
    try stdout.print("Original: {s}\nReversed: {s}\n", .{text, buffer});
}