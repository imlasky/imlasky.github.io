---
layout: post
---
Here's my first post of the website. I figured the first project I should try to tackle is actually creating a home base for all of my other projects -- so here I am.

For a little bit of background, I was inspired by, and inadvertently took the minimalist look of, the website[tinyprojects.dev](tinyprojects.dev). If you haven't checked out that site, I highly recommend it -- he's got something fun going on. 

However, unlike him, I'm not from a web dev background. Sure, I have some computer and data science experience, mostly through the lens of Jupyter notebooks, but I did not (and still do not) understand much of anything when it comes to the web. 

But hey -- fuck it, right? Let's do it anyways. 

***Disclaimer***

In no way, shape, or form should this be a guide. Please, please, please do not take my word for anything you are about to read. All I can do is document how I approached this whole thing and where I landed. 

For now, it *seeeems* to be functional, and I'm happy with that. When it stops being functional for my needs, I'll revisit it! 

Let's hit it. 

## How I built tempproject.dev

Tl;dr, I did the following:

1. Purchased a custom domain from Google Domains
2. Downloaded Jekyll (this was BY FAR the longest part of the whole thing)
3. Setup Github Pages for my account
4. Linked my custom domain to Github Page

The domain part was easy -- head on over to[domains.google](https://domains.google), pay Papa G twelve bucks, and the domain of your dreams is yours (unless it's taken, of course).

Next up was how to actually build the thing and let me tell ya ---

### *A brief interlude detailing a newcomer's interaction with web dev frameworks*

All right, where do I even begin? It's a mess. I'm sure this is just beating a dead horse by now, but holy shit I was ***struggling***.

Now, with that out of the way. I had a few criteria I wanted this framework to meet:
1. It lets me add pages quickly
2. I don't have to learn a ton of Javascript upfront
3. It just *works*

The reason I chose to use a framework at all is I simply don't trust myself to maintain a folder full of html files and hope it all works out -- I know myself too well to play into that game. 

So, one of my temp projects (which I will document and add to the site at some point), was a startup idea that was built with the Django framework. It worked great and was definitely a contender when deciding what to use here, however I opted not to because it actually had too much functionality for what I wanted and it seemed too over the top. 

Along the journey, I discovered this idea of ["the Jamstack"](https://jamstack.org/), and quickly read a new phrase that looked interesting: "Site Generator". So, of course, I clicked it.

First up on the list of generators was Next.js. I sort of already discounted it for my purposes simply because of the .js part, but I checked it out anyways. Upon first look, it immediately made sense why websites have *felt* like they all look the same nowadays -- big, bold, sans-serif font to pull together a simple, clean, look. I perused the documentation, and concluded it was indeed overkill. 

I went down the list, after having similar experiences looking into Hugo and Gatsby, until I hit Jekyll. Granted, I didn't know jack about ruby or gems or anything like that, but the idea that it worked really well with Github Pages and I didn't have to go through the hassle of figuring out deployments or whatnot again, made it a really nice sell. 

So, I took a crack at it. 

## Doing the rest

I followed Jekyll's[step-by-step tutorial](https://jekyllrb.com/docs/step-by-step/01-setup/)to get the website setup and so I can become familiar maneauvering around. I'll admit, I thought the simplicity of the process was rather refreshing, and the combination of writing posts with markup and using liquid tags seemed really intuitive. 

So, I wrote the "Hello World", made the same posts about a bunch of fruit, and was satisfied at how it worked. 

With the simple website completed and looking like it works, I pushed the code to the repo I will be using for my Github Pages. I tried to follow the tutorial from Github, but found that it didn't matter -- a simple push to the repo after the Jekyll step-by-step worked great! (Side note: I dislike any and all Github documentation, or Microsoft documentation for that matter, it's so overly verbose and confusing to navigate for me. But that's a rant for another time.)

Last was to add my custom domain. I first needed to add the apex domain redirect, so I followed the[Github tutorial](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain)on that. After that, I needed to add the `www` subdomain, so I followed the[instructions](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain-and-the-www-subdomain-variant)on that one.

After a bit of refreshing, I was successfully able to navigate to a page with my domain that said "Hello Worl" becuase I forgot to type "d" -- felt like a great beginning.  