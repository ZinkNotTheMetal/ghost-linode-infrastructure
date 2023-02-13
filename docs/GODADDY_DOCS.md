# GoDaddy Domain migration

### Notes

- Once the terraform is run `.infrastructure/tf/linode/src` this will create us a domain inside of linode so then we can begin the management of the domain within linode instead of GoDaddy
- Once the nameservers are pointed from GoDaddy to linode we can have linode create A/AAAA or CNAME records without having to login to GoDaddy to do the management

## Steps for changing the nameservers (GoDaddy)

1. Let's grab the name servers by logging in to [Linode](https://linode.com)
2. Navigate to the newly created domain (in our case thesmartestcondo.com)
3. Copy the name servers (we will be putting them in GoDaddy)
4. Login to [GoDaddy](https://godaddy.com)
5. Go to Domains
6. Click on the domain you want to put into linode
7. Go to Manage Domain
8. Scroll down to the Nameservers section
9. Click Change
10. At the bottom we will select `Enter my own nameservers (advanced)`
11. We will insert all the nameservers from linode into each box. Just put in the domain (i.e. ns1.linode.com)
12. After you insert all of the linode servers
13. Click Save
14. Select the consent checkbox
15. Continue!

Now you are complete and have Linode hosting your GoDaddy domain

### NOTE:

Linode will not host our new DNS zone yet unless we have a node inside of linode.

```text
Your domains will not be served by Linode’s nameservers unless you have at least one active Linode on your account.
```
