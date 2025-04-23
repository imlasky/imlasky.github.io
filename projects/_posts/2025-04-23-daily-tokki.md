---
layout: post
---

### Background
My partner and I have been working on[Daily Tokki](https://dailytokki.com?ref=tempproject) for the better part of 6 months now and are quite happy with it so far.

For some background, she's Korean and I am learning Korean to better communicate with her family as well as because I've fallen in love with the language -- it's so well thought-out, despite its quirks (thanks, King Sejong).

So, I wanted a good way to practice my Korean daily. She always was looking for a way to improve her English, despite already being fluent. So, we figured out that we both wanted something along those lines. 

I've never been much of an app kind of person and the gamification of them seem to ruin the idea of studying. I wanted a serious study tool, the likes of[Anki](https://apps.ankiweb.net), which knew where I was weak and pushed them repeatedly.

I didn't need a slick UI or an app, but I needed it to be sent to me each day. 

### Building it

So, we decided on a daily email sent to us with that day's lesson. We would respond to the email which would then respond back with corrections and suggestions that we can implement next time. It also sends a Anki-compatible list of words and examples that can be imported quickly. 

#### A slight tangent about email

I think email is probably the most underrated user interface at the moment in the new "age of AI". It's a natural language interface. The AI-models are natural language models. There's the ability to command entire programs with the quick send of an email. 

And here's the best part: everyone has already downloaded the app to "run" your program. It's their email client. 


### Email
We use Postmark and 