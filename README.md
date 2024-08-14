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

## Links to Useful Resources



Snort Downloads -- [Sources, Binaries, Documentation](https://www.snort.org/downloads)
Emerging Threats Rules -- [Look through the various directories for rules](https://rules.emergingthreats.net/)
Emerging Threats Blog -- [Snort3, Snort2lua, and the Emerging Threats Snort 2.9 ruleset](https://community.emergingthreats.net/t/snort3-snort2lua-and-the-emerging-threats-snort-2-9-ruleset/475)
Source Code -- [](https://github.com/snort3/snort3/blob/master/lua/snort.lua)
Source Code -- [](https://github.com/snort3/snort3/blob/master/lua/snort_defaults.lua)
Snort Docs -- [File handling rules](https://docs.snort.org/rules/headers/file_rules)
Snort Docs -- [File Identification Rules](https://docs.snort.org/rules/headers/file_id_rules)
Source Code -- [File Magic Rules](https://github.com/snort3/snort3/blob/master/lua/file_magic.rules)
Snort Docs -- [fast_pattern](https://docs.snort.org/rules/options/payload/fast_pattern)
Snort Blog -- [Converting custom Snort 2 rules for Snort 3 compatibility](https://blog.snort.org/2020/09/converting-custom-snort-2-rules-for.html)
Snort Docs -- [Writing rules, services in place of protocols](https://docs.snort.org/rules/headers/protocols)
Snort Docs -- [snort.lua ips section detailed with rules format, using `-Q --daq` when starting Snort in IPS mode](https://docs.snort.org/start/rules 
NFQ vs. af_packet -- [Snort IPS With NFQ (nfqueue) Routing on Ubuntu](https://sublimerobots.com/2017/06/snort-ips-with-nfq-routing-on-ubuntu/)
Snort Docs -- [Payload Detection Rule options](https://docs.snort.org/rules/options/payload/)
NFQ code -- [Snort's Github page for daq_nfq.c](https://github.com/snort3/libdaq/blob/master/modules/nfq/daq_nfq.c)



