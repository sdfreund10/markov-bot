# Markov Bot

This is a simple sentence generator that uses a Markov chain to generate a full
sentence based on user-inputed text to train the bot. What is a Markov Chain
you ask? He is a [wikipedia article][https://en.wikipedia.org/wiki/Markov_chain].
At a high level, a Markov Chain considers the current state of the system and 
determines the next system state using probability calculations. It takes the
selected state and repeats the process until it reaches a steady state.

# How does this generator work?

Markov bot takes a string of text (the longer the better) and uses that to
compute the probability a word follows another word. 

Example:

"I like writing ruby. I like writing javascript. I like programming in all languages!"

would produce a set of step definitions like so:

```
{ "I" => { "like" => 1.00 } }, { "like" => { "writing" => 0.67, "programming" => 0.33 } },
{ "writing" => { "ruby" => 0.5, "javascript" => 0.5 } }, ...
```

and so on. In this notation, the outermost key is the "current word", and the inner hash
contains the possible words and the percentage of the time the bot expects that
word to appear after the "current word". Thus, when Markov bot recieves training sentences,
it learns how often a given word follows another word and can generate a valid-ish
sentence. 

Note: To prevent the bot from starting off with a really strange first word, 
Markov bot also stores the first word in each sentence and uses them as seeds for
generated sentences.

# Thats kinda neat. How do I use it?

Using it is way more simple than the above might imply. It's as simple as typing
some sentences in the input box, sumbiting, and then generating a sentence.
Markov bot is pretty dumb though and needs a lot of examples to figure out how to
generate a decent sentence that it has not already seen before so try to feed him
as much as possible before making him spit out a sentence.

# How could Markov Bot be made better? 

There are a number of ways. For one, considering a "current phrase" or even "current sentence"
would make the generated sentences a whole lot more intelligible, as then Markov Bot
would have more data to use in selecting the next word. Every additional word stored
requires a whole lot more training data though and it can be funnier to produce
ridiculous sounding sentences.

Additionally, it would help if I wrote some rules for generating a valid sentence.
For example, specifying that a sentence needs at least one verb and one vowel.
That is a whole lot more work and I'm just doing this for fun so I do not plan
to do that.

# To do list

These are the things I need/would like to do, roughly in order

- ~~Add a button to generate a sentence~~
- Deploy to Heroku
- Add loading indicators
- Css the crap out of the app
- Add a link to this repo
- Store sequences with a user/session field

