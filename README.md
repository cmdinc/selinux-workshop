# SELinux Workshop Stuffs

## What's in here?

* A tool that takes shellcode assembler as a hex string and executes it
* A website that takes input and passes it to the above tool
* A starting SELinux Policy to secure this website
* A slide deck from the BSides Vancouver workshop

### Centos7 SELinux Policy Setup 

To write your own policy from scratch
Copy the website to `/workshop/website`

```
# mkdir ~/workshop-policy
# sepolgen -p workshop-policy/ -w /workshop/website --inetd /workshop/website/website
```
