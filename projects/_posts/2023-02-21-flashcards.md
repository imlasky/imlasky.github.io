---
layout: post
---

### Motivation and Hypothesis

I have been learning Korean more seriously lately, and so I have been going through flashcards. I came across the flashcard program, Anki, which uses spaced repetition to help with memorization and learning. There are a few issues I have with it, though. 

First, the spacing between cards is driven by an algorithm, namely the SM-2 algorithm (which I go over a bit more[here]({% post_url /blog/2023-02-20-language-learning %})), only takes my input on the difficulty of the word as a way to calculate the time between cards, no other information is taken into account, namely the content of the card itself. 

Second, I want to be able to study the cards forwards and backwards. That is, I find I am better at recognizing Korean words and phrases and translating them back to English, but the opposite direction is much more difficult. Being able to translate in the opposite direction and take that into account would also be helpful. 

Third, unless the cards are grouped together by the creator (by the way, shout out to Avita who made the deck I am using), there is no easy way to group cards into topics. Sure, you can add tags, but it doesn't automatically create groups.

### Proposed Solution

I want to build a spaced repetition web application that:
1. Takes into account different signals to better determine what the spacing should be for each card
2. Makes me study the cards forwards and backwards, which also adjusts the spacing calculation
3. Groups cards together by content, letting me understand blocks of content at a time instead of a bunch of random phrases pulled together

Starting with the first one, I believe the following features will be important to training a model that will help me learn better by spacing out cards more appropriately:
1. Amount of time it takes me to select an answer
2. Vectorized content of the card
3. Direction of the card (English to Korean or Korean to English)
4. History of previous attempts

As I continue, this list of features may change, but I think those are good starting points. 

For the second one, this ties into point 3 above. It will swap the question and the answer to make sure I am proficient in both directions. 

The third point will also tie in to the vectorizing of the content. I can probably do some simple K-means clustering for the content so I can keep the topics relatively similar and study the chunks one at a time. 

There will be a few decisions along the way, which I may borrow some from other methods, such as: 
* Number of difficulty options
* How many new cards per day
* Probably some more that I can't think of right now

Anyways, let's get cracking - I want to build. 

### Feburary 21

Today, I set up the basic functionality of the app. I pulled in all 2500-ish flash cards and their respective audio files into the data base. 

Right now, I have the following fields for the words:
* Original phrase
* Translated phrase
* Alternative translation
* Additional information
* Next attempt (to be filled)
* Audio file

I also created an Attempts collection that relates back to the words, with the following fields:
* Attempt time (how long I was thinking about the answer / pronouncing the word)
* Review time (how long after I see the answer that I review the word and definition)
* Direction (whether it is English to Korean or the other way around)
* Answer ease (a scale of 0-3 for wrong, hard, okay, and easy, respectively)

I can tentatively see that the attempt time and the answer ease might end up being two fields that indicate the same thing, but I'm still going to hold out for if there is some other information in there. However, I think the review time is novel, it would be curious to see if review time has any effect at all on my memory. Sometimes things just click, and other times they don't, you know?

As of this point, I still have to create the embeddings for each of the cards for both languages. Additionally, the next attempt field is the output of the model. So, I have to figure out how to do that in real-time. As of right now, it posts to the database, but I am not sure how to continually update the model with new information. While there isn't much data, maybe I should use a stop-gap measure like relying on the SM-2 algo? Still to be determined. 