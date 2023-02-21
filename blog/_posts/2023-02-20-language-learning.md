---
layout: post
---

Today, I have begun to take learning Korean more seriously. I learned about this tool called[Anki](https://apps.ankiweb.net/), which is a program to create flash cards for spaced repetition. 

I have heard of spaced repetition before, but I never looked much further into it. When I did, I found it is rich with history and interesting algorithms for calculating the spacing between each of the sessions. 

For instance, the algorithm that Anki uses is part of the SM-family of algorithms. SM is an initialism for SuperMemo, another platform for a similar purpose. Specifically, the algorithm Anki uses is based on the SM-2 algorithm (for exact details of the modifications, see: https://faqs.ankiweb.net/what-spaced-repetition-algorithm.html)

Let's take a deeper look at the SM-2 algorithm. 

When presented with a card, a user can grade their response between 0 and 5, where:

* 0 - total blackout
* 1 - incorrect response; the correct one remembered
* 2 - incorrect response; where the correct one seemed easy to recall
* 3 - correct response recalled with serious difficulty
* 4 - correct response after hesitation
* 5 - perfect response

The SM-2 algorithm uses this grade, ***q***, to calculate the "easiness factor", ***EF***, with the following equation, where ***EF*** equals 2.5 by default:

`EF'= EF + (0.1 - (5 - q) * (0.08 + (5 - q) * 0.02))`

Okay - that's a bit of a strange equation to come out of nowhere. Let's unpack it a bit:

If `q=5`, then ***EF*** is increased by 0.1. When `q=0`, then ***EF*** decreases by 0.8. Lastly, if `q=4`, then ***EF*** remains unchanged. If ***EF*** falls below 1.3, then it should just be set to 1.3. According to the author, "I noticed that E-Factors should not fall below the value of 1.3. Items having E-Factors lower than 1.3 were repeated annoyingly often and always seemed to have inherent flaws in their formulation (usually they did not conform to the minimum information principle)".[Source](https://www.supermemo.com/en/blog/application-of-a-computer-to-improve-the-results-obtained-in-working-with-the-supermemo-method)

Great. So, we have this easiness factor, so what? Well, this easiness factor is going to help determine how long it should be between appearances of this card (in days). It is called the inter-repetition interval: ***I***. 

If the user has a correct response, (`q>=3`), then ***I*** will update according based upon the number of times the card has been successfully recalled, ***n***. That is,

`I(n=0) = 1 (first time getting it correct)`
`I(n=1) = 6 (second time getting it correct)`

For `n>1`,

`I(n) = I(n-1)*EF`

If it is an incorrect response, reset ***I*** and ***n*** to 1 and 0, respectively.

Coming back up from the math, what can we say about this algorithm? Well, the first off is that the coefficients are a tad...squishy. They seem to be the effect of a lot of trial and error, iterated over the course of the author learning over 10,000 english words using this system. 

Second, it relatively makes sense: cards that are harder should be brought back to the front of the pile, cards you're doing well with should exponentially increase in their inter-repetition interval. 

Granted, this algorithm was created in 1985, but it has significantly stood the test of time. So props for that!

I will be using Anki myself to test out how effective this is, but I have some ideas for improvements. Namely, there is no adjustment for what is actually on the cards themselves. I tend to hate injecting machine learning when a solution like this might just do fine, but I'm tempted to see if I can add a little _zhuzh_ to it and see if it accelerates my learning. 

