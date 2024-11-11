# Creating a Livecoding Workshop for Kids - Lessons Learned

## Introduction

In September 2024, I embarked on my first major livecoding workshop project in a couple of years, in conjunction with a local kids shop/art/music/maker space aiming at kids aged 10 and up.
This post is meant as a fairly raw summary of how I approached it, the things that worked, and the things that I would probably change for next time - with the goal being that others can learn from my mistakes (and possible successes!)

## Venue Choice

For context only, I live in a small-ish city of about 25,000 people in regional Australia. We do not have a large variety of suitable arts spaces or organisations for doing this sort of thing - however a shop called Make-a-ma-jig opened in late 2023 with a focus on creative workshops for kids. My son started getting drum lessons there, and after several (wide ranging) discussions with the owners about their interests and goals for the shop, I proposed doing these livecoding workshops and they loved the idea since exploring tech in a creative context was a gap they wanted to fill in their curriculum.

Some key things about the relationship with the venue:

*They did the marketing*
I provided some descriptions of what it's about, they formatted it for consumption by their customer-base

*I did the lesson planning*
As a teacher, the domain knowledge lies with me so having these clear lines drawn was helpful in working out who owned what area of the product. In this case, I did ask for feedback/recommendations from the venue but final choice always lay with me.

## The Plan

In simple terms, I wanted to do 4x weeks of exploring different languages (audio minitidal/estuary, visual punctual, audio strudel, visual hydra), a 5th week to hone in on one or two languages and then a demonstration/performance for the kids to show-off some of the stuff they learnt in the 6th week (parents invited). It included some languages I was not as familiar with to try and extend the opportunity to explore to myself as well.


Before beginning, I wrote a [relatively detailed overview](https://docs.google.com/document/d/1Z01dPVMlJMlOobWonFpk1MBkTXG3u0X2r5I6oWJITQg/edit?usp=sharing) of how I planned to approach each week, and wrote a [set of slides](https://docs.google.com/presentation/d/19qY2wa65UC0coEdhGgoT2PM4uHvhQ5FtBrnm642jaG8/edit?usp=sharing) for the 1st Week
 - [Lesson Plan Overview](https://docs.google.com/document/d/1Z01dPVMlJMlOobWonFpk1MBkTXG3u0X2r5I6oWJITQg/edit?usp=sharing)
 - [Slide Deck (complete)](https://docs.google.com/presentation/d/19qY2wa65UC0coEdhGgoT2PM4uHvhQ5FtBrnm642jaG8/edit?usp=sharing)

A key point was to not overdo the lesson planning because I wanted to be flexible - if there was something that they wanted to explore more than something else we could do that.

## The First Lesson (and how quickly plans change!)

I had three students for the first course, ages 10-13. By the time we'd written our first short piece of code in the lesson, it was clear that we were not getting through four languages in four weeks. 

Despite using exclusively web based platforms (estuary/minitidal for the first lesson), the kids were still bringing their own devices and this brought it's own set of unexpected (and expected) issues. One child had a tablet without a keyboard (anticipated, I had a spare laptop), one child couldn't get their bluetooth headphones to connect with their laptop (expected, I had spare wired headphones), one child's laptop inexplicably would not enter a quote character `"` unless you pressed the key multiple times (totally unexpected, an external keyboard did not help here).

Further issues experienced included difficulty adhering to syntax rules, including:
 - when you can put a space and when you can't
 - using two single quote characters `''` to look like a double quote (because your double quote key is broken!)
 - difficulty remembering to match quotes, parentheses, brackets etc
This is just a result of their age and general experience, but it was something that in hindsight, I did not pay enough attention to and would dedicate a section of the first lesson to next time.

Another challenge due to the age of the children was having a safe space to share links and code that wasn't going to open up a world they are not ready for (eg Discord). I ended up using Etherpad (collaborative, anonymous note taking app that you can self-host) and found a handily named french instance at https://pad.education . This proved to be a killer feature, and I will likely do all my workshop notes in etherpad next time.

### Takeaways:
 - Prepare for unexpected hardware issues (spare laptops, keyboards, headphones, mice)
 - Focus at least some of the lesson to the importance of syntax correctness because most of your time will be spent debugging, and with a large class that quickly becomes time consuming
 - create a space for the group to share notes, links, code and soforth that is safe/anonymous

## Second Lesson

My language-per-week plan went out the window. My second lesson discarded the visual languages altogether and we began to learn Strudel. It has excellent built in documentation and examples, and provides great visual feedback for events. The downside is that it is more syntactically strict than minitidal/haskell (more parentheses, functions/arguments not allowed to have gaps etc), is not collaborative by design, and I am also less familiar with Strudel but this was meant to be a learning experience for all of us, so...

Strudel was the right choice - everyone got on board and we battled through our syntax rules and my lack of function familiarity with Strudel and began the journey in earnest.

By the end of this lesson I was feeling a bit flat, I'd lost a student from the first lesson who thought she'd be learning something different. I wasn't getting a lot of feedback from the remaining students, 
