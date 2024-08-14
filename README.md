# firewallProjectPublic

Hi, I'm sharing several Snort 3 config files here. 

Originally I posted this seeking help in getting Snort 3 running in a Docker container (inside a VM, to boot). 

Now I'm keeping this posted to share my Snort3-Docker config. I couldn't find a single resource, or even ten resources, that showed how to make this run the way I'm running it.

These are some of the files included here:
- snort.lua -- Note the snort.lua for Snort 3, no longer a snort.conf
- Dockerfile -- please don't laugh (out loud), and please make suggestions
- cs6035.rules -- custom rules for the project, in progress

## Snort 3 and Docker

Once I get these files tightened up, I'll keep them shared publicly to help others who need configuration ideas for Snort 3.

## Steps to Mention

- Rulesets: I would mention that I use the [Emergent Threats](https://rules.emergingthreats.net/OPEN_download_instructions.html) rules. The ones I found were for Snort 2. You need to get the `snort2lua` executable (for Linux) and convert the rules files to Snort 3 format. Even after conversion there were some issues with the version of Snort I used so I wrote the convert_rules.sh script to be used after you run `snort2lua`.

- Help is More Rare: I would mention that most of the advice out there is for Snort 2's old-style `snort.conf` files. The new Snort 3 uses the snort.lua file, which is written in the Lau language. It's pretty cool once you get used to it.

- Novice Docker: Please don't laugh too hard at my poor Dockerfile, it's a learning experience and I already see better ways to do things in a more compact fashion.

- Yes, Docker: And while we're at it, yes, this shows how to build Snort in a Docker container, which I'll explain at length below.

- Can't RUN Snort: I found it was necessary to use the ENTRYPOINT approach, with the entrypoint calling a script.

- Setting eth0 promisc: I'm not really convinced that the network interface really needs to be set to promiscuous for the purposes on this project, but I left it in there.

## What is this For?

This is for a Firewall Project being built for the [Introduction to Information Security Course](https://omscs.gatech.edu/cs-6035-introduction-information-security) in the [OMSCS](https://omscs.gatech.edu/) program at Georgia Tech.

The idea is students are given a virtual machine (VM) with various Docker containers on it. These containers are used to do the class projects. Projects are segregated by users, requiring a different login for each project. This allows us to have control over the full user environment, and provide users a ready-to-go setup.

Here in the Firewall Project students will do a section of the project learning nmap. Then they will use libraries such as scapy to create and execute various types of network attacks on the container running Snort 3.

In theory, Snort3 will have rules setup to block and alert on such attacks. There will be another container that watches the Snort 3 log files for the correct output. When the monitor program sees the output it's looking for, it will give the student a flag to submit for credit on the project.




