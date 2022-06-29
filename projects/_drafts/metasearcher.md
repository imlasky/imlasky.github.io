---
layout: post
---

There have been a decent amount of observations about needing to add *site:reddit* to Google searches to get the desired result. [[1]](https://future.com/the-future-of-search-is-boutique/)[[2]](https://dkb.io/post/google-search-is-dying) I also frequently use this tactic to see reviews on even the most mundane things, like water bottles or toasters. 

However, this got me thinking if there's a better way to amass communal knowledge into a more digestible presentation. That is, for sites like Reddit, message boards, tutorials, etc. is there a good way to distill all of it down to answer a subjective question as objectively as possible?

## The Problem

Okay, so first things first: I want to narrow the problem space a bit and focus on a single portion of search that I find kind of meh: finding recipes. 

Let's start with one of my favorite dishes: paella. I go to Google, search for *paella recipes* and get this:

![Paella search result](/assets/images/metasearch/paella.png)

Let's break what we have:

![Paella search result color coded](/assets/images/metasearch/paella_color_coded.png)

* In magenta, Google says that it has about 30,300,000 results for paella recipes. Hot damn, that's a lot. 
* In green, the first result appears with:
	* the title of the dish with the website it comes from
	* a very rough (and incomplete) description of how to make paella in the description
	* a rating of 4.9 stars with 375 votes
	* a cook time of 1 hour
* In blue, we have 2 other recipes along with the first result recipe. Each have:
	* the title of the recipe
	* which website the recipe is from
	* a rating and number of votes
	* cook times
	* a rough (and incomplete) list of ingredients
* In red are related questions -- I was only able to get the first related question in the screenshot, but it'll do. 

So, to recap, by searching for paella recipe, I was met with a number I don't care about and 3 recipes with incomplete instructions and/or ingredient lists. 

From this point, the normal order of operations, at least for me, is:
1. Click the first link
2. Read the recipe and list of ingredients
3. Go back
4. Click a link with a higher number of reviews, maybe?
5. Read through that recipe
6. "Wait, what did the other recipe call for?"
7. Go back
8. "Oh, got it."
9. Go back
10. Click 3rd recipe to see if there is a pattern
11. Go back
12. Click second recipe because I like the instructions more.

I just want the damn recipe, maybe with some tips baked in.

## The Solution

Combine all the recipes together!

Okay, so clearly, that is a *gross* simplification, but surely there are bits and pieces of each recipe that are common enough that we can start to create a semblence of a general consensus?

I guess we'll find out!

In more detail, what I'd like to do is:
1. Index all the recipes from every recipe site
2. Create a similarity ranking for recipes
3. Train a model on how to cook a dish based upon the collective instructions
4. Wrap it up in a nice interface

I hope the outcome is a way that I can search for a recipe, and the result is a recipe with some added "cool tips" along the way, maybe. I'd also like if it listed the sources that contributed most to the recipe, so I can go see the original recipes.

Seems easy enough with absolutely no potential pitfalls at all. 

## Proving the idea

Going along with the paella theme, I first want to get some recipes. I'll deal with indexing, compiling, and web scraping later. Let me first just figure out if I can have a computer combine these recipes for me.