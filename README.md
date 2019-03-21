# Killer Queen

> 吉良吉影は静かに暮らしたい

Script to move the clock some years in the past when [neubot/botticelli](
https://github.com/neubot/botticelli) did not existed. Caused by
issues that we're seeing in the [M-Lab
platform](https://measurementlab.net) where someone that probably
integrated [Measurement Kit](
https://github.com/measurement-kit/measurement-kit) is hammering
the platform every six hours with many clients.

So, we have determined that an initial mitigation step is to disable
botticelli in a hackish way for each running M-Lab server. If more
violence will be required, we'll make a new release of
[neubot/server](https://github.com/neubot/neubot-server) that does
not include botticelli.

An early removal of botticelli is not a big deal, since [most Neubot
server side components are not poised to surive the M-Lab platform
upgrade](https://www.measurementlab.net/blog/retiring-neubot-client/).
And botticelli is clearly among the components that will be retired.
So that moving it to the attic a couple of months in advance is not
a big deal.

The name of this repository, the description, and the motto are a
reference to JoJo's Bizzarre Adventures' Diamond is Unbreakable
villain, [Yoshikage
Kira](https://jojo.fandom.com/wiki/Yoshikage_Kira_Wants_to_Live_Quietly_(story_arc)).
The main reason why I am dropping this reference here is because I
was re-reading JoJo's manga when I was made aware that botticelli
was causing issues to M-Lab. Also, moving the clock some years back
is kinda funning in the context of Yoshikage Kira.
