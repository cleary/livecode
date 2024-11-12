# Creating a Livecoding Workshop for Kids - Lessons Learned

## Introduction

In September 2024, I embarked on my first major livecoding workshop project in a couple of years, in conjunction with a local kids shop/art/music/maker space aiming at kids aged 10 and up.
This post is meant as a fairly raw summary of how I approached it, the things that worked, and the things that I would probably change for next time - with the goal being that others can learn from my mistakes (and possible successes!)

## Venue Choice

For context only, I live in a small-ish city of about 25,000 people in regional Australia. We do not have a large variety of suitable arts spaces or organisations for doing this sort of thing - however a shop called [Make-a-ma-jig](https://makeamajig.com.au/) opened in late 2023 with a dual focus on quality products and creative workshops for kids. My son started getting drum lessons there, and after several (wide ranging) discussions with the owners about their interests and goals for the shop, I proposed doing these livecoding workshops. They loved the idea since exploring tech in a creative context was a gap they wanted to fill in their curriculum.

Some key things about the relationship with the venue:

**They did the marketing**

I provided some descriptions of what it's about, they formatted it for consumption by their customer-base - this worked well, I would've overcomplicated it!

**I did the lesson planning**

As a teacher, the domain knowledge lies with me so having these clear lines drawn was helpful in working out who owned what area of the product. In this case, I did ask for feedback/recommendations from the venue but final choice always lay with me.

## The Plan

I wanted to do 6x 1 hr lessons over 6 weeks. 4x weeks of exploring different languages (audio [minitidal/estuary](https://estuary.mcmaster.ca), visual [punctual](https://dktr0.github.io/Punctual/), audio [Strudel](https://strudel.cc), visual [hydra](https://hydra.ojack.xyz)), a 5th week to hone in on one or two languages and then a demonstration/performance for the kids to show-off some of the stuff they learnt in the 6th week (parents invited). It included some languages I was not as familiar with to try and extend the opportunity to explore to myself as well.

Before beginning, I wrote an [overview](https://docs.google.com/document/d/1Z01dPVMlJMlOobWonFpk1MBkTXG3u0X2r5I6oWJITQg/edit?usp=sharing) of how I planned to approach each week, and wrote a [set of slides](https://docs.google.com/presentation/d/19qY2wa65UC0coEdhGgoT2PM4uHvhQ5FtBrnm642jaG8/edit?usp=sharing) for the 1st Week
 - [Lesson Plan Overview](https://docs.google.com/document/d/1Z01dPVMlJMlOobWonFpk1MBkTXG3u0X2r5I6oWJITQg/edit?usp=sharing)
 - [Slide Deck (complete)](https://docs.google.com/presentation/d/19qY2wa65UC0coEdhGgoT2PM4uHvhQ5FtBrnm642jaG8/edit?usp=sharing)

A key point was to not overdo the lesson planning because I wanted to be flexible - if there was something specific that they wanted to explore more deeply I wanted to be able to follow that thread.

## Gear

I tried to keep it as simple as possible - the venue supplied the space, table, chairs and power, I brought a (barely working) projector, laptop and small portable bluetooth sound system. I could get in and setup each week in under 10 mins, and out in a similar time.

## The First Lesson (and how quickly plans change!)

I had three students for the first course, ages 10-13. By the time we'd written our first short piece of code in the lesson, it was clear that we were not getting through four languages in four weeks. 

Despite using exclusively web based platforms (estuary/minitidal for the first lesson), the kids were still bringing their own devices and this brought it's own set of unexpected issues. One child had a tablet without a keyboard (anticipated, I had a spare laptop), one child couldn't get their bluetooth headphones to connect with their laptop (expected, I had spare wired headphones), one child's laptop inexplicably would not enter a quote character `"` unless you pressed the key multiple times (totally unexpected, an external keyboard did not help here).

Further issues experienced included difficulty adhering to syntax rules, including:
 - when you can put a space and when you can't
 - using two single quote characters `''` to look like a double quote (because your double quote key is broken!)
 - difficulty remembering to match/keeping track of pairs of quotes, parentheses, brackets etc

This is just a result of their age and general experience, but it was something that in hindsight, I did not pay enough attention to and would dedicate a section of the first lesson to next time. These guys are also not generally fast typers at this stage, and have very little familiarity with special character positioning and use, or keyboard shortcuts for selecting/copying/pasting which slowed things down further.

Another challenge due to the age of the children was having a safe space to share links and code that wasn't going to open up a world they are not ready for (eg Discord). I ended up using [Etherpad](https://etherpad.org/) (collaborative, anonymous note taking app that you can self-host) and found a handily named french instance at [pad.education](https://pad.education). This proved to be a killer feature, and I will be trying to work out a way to use it more next time.

## Second Lesson

My language-per-week plan went out the window. My second lesson discarded the visual languages altogether and we began to learn [Strudel](https://strudel.cc). It has excellent [built in documentation and examples](https://strudel.cc/workshop/getting-started/), and provides great visual feedback for events. The downside is that it is more syntactically strict than minitidal/haskell (more parentheses, functions/arguments not allowed to have spaces before arguments etc), is not collaborative by design, and I am also less familiar with Strudel but this was meant to be a learning experience for all of us, so...

Strudel was the right choice - everyone got on board and we battled through our syntax rules and my lack of function familiarity and began the journey in earnest.

By the end of this lesson I was feeling a bit flat, I'd lost a student from the first lesson who thought she'd be learning something different. I wasn't getting a lot of feedback from the remaining students but at least they had their heads down and were writing code!

## Remaining Weeks

Over the remaining weeks we kept at it, the kids grew in confidence and I received some direct and positive unsolicited feedback from the oldest student which was a much needed boost for my own morale. The kids were relaxed and having fun (primary goal achieved!)

We began doing little collaborative jams in [Flok](https://flok.cc), the kids would bring their own patterns, we'd mash them together and then we'd all swap cells and change little bits of each others patterns. At a personal level, I think the exposure to collaborative livecoding is really important and something that too few Livecoders explore so this was an important stage imo.

We continued to work through the Strudel docs, at a slow but steady pace. I would supply an optional homework challenge each week (hot tip, kids attending these sorts of things often have a pretty full out-of-school curriculum so don't force it), and by the 4th Week I was getting some results back.

## Final Week Performance

For the final week I invited the parent(s) to attend, and the idea was that the kids would play a piece they had composed and talk about it but they were still battling with syntactical issues and typing speed so instead I gave a short presentation to explain what we'd done and give the parents a passing grasp on what we had been doing (and why) - then we all jammed together! It was fun, low pressure and positive for everyone involved, ending on a nice high.

The students were very keen to attend if I ran it again (or something similar, maybe just focussing on visuals this time), they had been mucking about with the tools on their school laptops because the sites weren't blocked and were feeling very much like they were building some skills that their peers would be jealous of, which is a handy advertising tool for the next session!

# Takeaways/Tips/TL;DR
 - Plan to change your plan
 - Prepare for unexpected hardware issues (spare laptops, keyboards, headphones, mice)
 - Create a collaborative digital space for the group to share notes, links, code and soforth that is safe/anonymous - https://pad.education worked for me
 - Cover the basics of keyboard shortcuts for selecting/copying/pasting text to help speed their process (a cheat sheet would be a great idea!)
 - Focus at least some of a lesson to the importance of syntax correctness because most of your time will be spent debugging, and with a large class that quickly becomes time consuming
 - Print workshop materials out - a lot of these kids don't have unfettered access to devices, so having printed material they can review while offline is helpful
