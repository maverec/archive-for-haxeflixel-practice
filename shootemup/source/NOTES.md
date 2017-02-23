NOTES:

Start	: 11.12.2015
This is going to be another shmup, but this time it's to try out a different way
of doing ECS with composure and haxeflixel. It'll be VERY experimental and may
have A LOT of hiccups.
I'll also be keeping track of what I work on from day to day, just as a better
reminder of what exactly I'm doing and the problems/solutions encountered. Short
version, keeping track of progress!

So far, using a typedef struct for components is pretty clean, but I have no idea how it will fare with resources in the long run. For today, the biggest downfall is freaking debugging. Logs aren't specific at all when an error occurs within a typedef. Means a lot more time is consumed trying to figure it out. Means that reading code has to be done VERY carefully and to not overlook details. This is fine for small games, but bigger ones will come with a whole lot of eye-strain and duct tape.

Might be a lesson in doing clean and readable code right off the bat instead of doing it quick and dirty, then paying for it later when it comes time to optimizations and debugging.


11.13.2015
Encountered a problem with collisions.
Sick and in bed.

11.14.2015
Still working on getting collisions to work. So far very little progress. What I've noticed is that using just GraphicNode and Node for this is not working out to be univeral. May have to create a different node just for collisions.

Created a different node for collisions.

11.15.2015
Got everything working.
Optimizations tomorrow!

11.16.2015
General optimizations completed!
Thinking about taking it one step further and taking the organization hierarchy one step further.
Removed the CollisionNode and edited the GraphicNode so that the scope can accommodate any graphic asset called. This cleaned up a few things, plus the Components typedef is a little shorter now.

11.17.2015
Reorganized and moved a few thing around into packages.


FINAL THOUGHTS
Using a typedef struct paired with Composure for ECS is a lot more organized and easier to read without, but not without it's little caveats. For one, a lot more lines of code are used compared to just using Composure. This may change in the long run though, since this shoot 'em up was very simple, so not a lot was done to make it 100% ECS ( as seen with the HUD blocks ).

I drew inspiration from Luxe for the typedef structs, since I really liked the way they did certain things. It also meant doing some custom code to get it to work seamlessly the way I wanted it to with Haxeflixel.

This also came about a lot faster than my last attempt, despite being confined to bed with the flu. Which also explains my complete lack of proper documentation of my progress after the first day haha!

I may keep this style, not just because of the speed but because I like the way everything is organized and easy to read without a million comments scattered all about the place. The only issue I am concerned about...is the resource cost of using such typedef structs. I have no idea if they are expensive to use compared to just using classes for my components.