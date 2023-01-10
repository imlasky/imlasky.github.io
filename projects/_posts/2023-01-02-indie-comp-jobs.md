---
layout: post
---

### Motivation and hypothesis
The idea came from me looking for a job myself. I became disenchanted trying to find a job from a non-VC-backed company. It was (and still is) legitimately difficult to do so. So, I thought: what if there was a way to find private companies that are profitable and looking to grow? None of that magical, profitability-will-come-later business that is so frequent with VC-backed startups. 

I tried myself to find these companies - I started on Indie Hackers, actually. I went to the Product Page and started just drilling down on each of the products. But it was a slog. Going through each one was just a tremendous effort, and frequently they are not hiring, which makes sense, since they don't *need* to unless it really hurts. 

So, my hypothesis is that in this two-sided marketplace, there are these characteristics of the job seekers and the companies:
* There is a growing sentiment in the tech community to look for more meaningful work rather than just chasing the salaries. Something that doesn't involve going after new valuations, overtaking the world, and can provide a good balance.
* Independent companies hire when it hurts. They've figured out how to become profitable and certainly want to keep it that way. 

### How I plan to build it

I plan to built it using[Phoenix.](https://phoenixproject.org) It is, in part, a way to learn more about Elixir and Phoenix, but also to incorporate some little "hey, that's kinda cool" effects along the way that I know would be a pain in the ass otherwise. 

I'm taking inspiration from[Japan Dev](https://japan-dev.com) and[Remote \| OK](https://remoteok.com), borrowing a bit from each. Namely, I like Remoteok's idea of first finding jobs to populate and become, essentially, a link aggregator initially to build the job-seeker side of the market. But I also like Japan Dev's idea of being paid _after_ the applicant gets the job, making it lower-stakes for the companies to post. 

As for monetization, I want to eventually rely solely on companies posting their jobs, and maybe some add-on services like visibility boosts. But I'm not worried about that right now. I just want people using it. 

### Timeline

I'm giving myself a month to try to flesh out a working prototype, source the jobs, and get people on the platform using it. 

---

## Updates

I'll be adding updates here as I continue to build. Here we go!

### Jan 3

I spent the majority of today trying to get my head around Phoenix. It's pretty much like drinking from a firehose, I'll admit. So, I decided, that for at least this first project, I want to focus on figuring out how to push it out fast and get people using it. 

So, I switched back to SvelteKit (which just reached 1.0!), and make a quick mock-up of functionality. Took about 45 minutes or so. 

![Indie Comp Screenshot](/assets/images/indiecompjobs/screenshot-2023-01-03.png)

I linked it up with a new (to me) ORM,[Prisma](https://www.prisma.io), to get some initial data flow, and it works like a charm. I can add to the database as I need, collect emails and do what I need with them. 

The thing I want to tackle tomorrow is dealing with a bit of authentication, since I don't want just anyone being able to post to the job board. 

I also found some sources to find independent companies, or bootstrapped companies on [dealroom.co](https://dealroom.co). Their suite and jobs leave a lot to be desired and it is difficult to navigate to the point I was actually able to see the bootstrap companies. I'll continue searching for other ways to find these companies and start creating a list of them to look for jobs (both for myself and the board).

### Jan 4

Well, it is deployed! (Kind of) 

As a summary, today I:
* Did a visual overhaul (seen below)
* Added in filter functionality for tags
* Added in some nice little visual cues for where to click (like on the apply button, for instance)
* Set up a CockroachDB
* Deployed to Vercel

Overall, the deployment was relatively easy - but it was a bit of a learning curve still. I have deployed other projects before (which were much harder), so this was easy in comparison. I feel like there should still be an easier way to do it, but I don't really know enough about it yet for how I'd go about doing it. 

I did some more visual adjustments - I find these to be the most enjoyable of all. I can't paint, but figuring out how to get things to look exactly as I want them is as close as I will get to being a good painter. However, it still feels as thought it is missing _something_ - some zhuzh. I think the blank white (or off-white) is really throwing me. I'll keep hacking at it. 

![New HomePage](/assets/images/indiecompjobs/screenshot-2023-01-04.png)

For tomorrow, my plan is to finish up the looks and start populating with actual data. I already know it will take some time to do this (currently only able to really do it via the Prisma studio), so maybe I'll make a page to create posts (both for me and as well as for future employers).

### January 5

Today was a bit uneventful. Rearranged how the svelte files look. Also been debating going for a pure minimalism kind of feel. Something along the lines of[Bearblog](https://bearblog.dev/). 

I want it to be solely focused on the job, the company, and the position. Nothing else, no fluff. So, maybe I'll try to whip up something similar tomorrow. Maybe I'll go back to Django for this? Thinking down the line, authentication is a bit underdeveloped within the SvelteKit community (although I still need to give[SvelteKit Auth](https://vercel.com/blog/announcing-sveltekit-auth) a try). 

Let's see if I can really bare-bones the site tomorrow. I want it crisp and minimal, but not unpolished (if that makes sense).

### January 6

Okay - so, I know I restarted this project like 3 times now, all with different frameworks, but I redid it again with Django. Just all django. Really simply. I borrowed a lot of inspiration from Bear blog, like I mentioned yesterday, and frankly, I am a huge fan of how it is looking. I mean just look at this:

![Minimalist screen shot](/assets/images/indiecompjobs/screenshot-2023-01-06.png)

The other one - before, felt...cheap? Like a site I would accidentally get redirected to while trying to find a movie for free and I click on the wrong play button. But this, just the simple html (even with a dark mode), feels, for lack of a better term, pure. (I know, I kinda got nauseous writing that too.)

Anyways, the benefit of this is that Django's auth is all batteries included. I have Sendgrid set up, emails working great, and able to use Django's admin panel to add things manually to start. 

Still trying to figure out the best way to transition from posting things myself to setting up payment, but I suppose that is putting the cart before the horse. Anyways, glad I got it to this stage (again) today. 

It's live at https://indiecompjobs.com, too. 

### January 7

I fleshed out the website a bit more today. I added the ability to remove the job from your dashboard, as well as implemented a hotness metric to rank the jobs based upon the posting date and how many people applied. 

I used the following equation to calculate hotness, which is pretty generic. If I feel the need to modify it in the future, I will. 

    order = math.log10(max(self.num_apply, 1))
    seconds = self.created_at.timestamp() - 1673063024
    hours = 12.5
    hotness = round(order + seconds / (hours * 3600), 15)  

I removed the ability to post a job for the meantime, as I want to focus on adding jobs manually and getting people to check it out. 

Additionally, I added some lightweight metrics from[Goat Counter](https://goatcounter.com), which are GDPR compliant, free for light traffic, and lightweight. Seemed like I should give them a shot. 

Anyways, on to figuring out how to find all these jobs, both for me to apply to, and figure out how to source.

One interesting thing that has come out of it is that I can find these companies, but they don't have RSS feeds for their jobs sites. So, keeping track of them can be a bit difficult. There are some sites that can make RSS feeds out of websites, but none seem to quite work the way I want. 

Potentially I can just add them to a list of companies and get an RSS feed of the giants like indeed.com or something and just filter based on those companies. Not sure yet what the winning strategy is, but will keep plugging. 

### January 9

Took a bit of a break yesterday, but progressed a bit more today. I added in some functionality to approve/reject the jobs that people post and plan to have the ability to post a job done tomorrow. 

I did some initial looking at other job posting sites to find jobs, and I think the initial verification will have to be through Crunchbase or something like that and maybe reaching out to the companies personally. 

Will be setting up some scripts to listen to the RSS feeds tomorrow as well. 

### January 10

Finished the approve/reject functionality. Set up some scripts to listen to RSS feeds from Indeed. Still TBD on how best to format them for the site, but I am able to pull relevant jobs. 

There are a lot of different types of jobs (duh), and I could in theory do an RSS feed for ALL jobs, but that seems a bit overkill. So, I limiting it to tech jobs for now, as I think HN might be the best place to post for now (and it is obviously tech-oriented). 

Might do a bit more tonight, but want to actually get jobs on the page, post, and see some people actually use it. 