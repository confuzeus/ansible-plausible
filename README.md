# Ansible Plausible

Setup your own [Plausible Analytics](https://plausible.io) instance in a few minutes.

Buying a subscription is the easiest way to get started with Plausible but this Ansible
playbook makes it easier for DIYers to self host an instance.

## Requirements

1. A server with Debian 11 installed.
2. A domain name managed at Cloudflare.
3. Your Cloudflare api token.
4. Email address with SMTP access.

## Quick start

Setup your ssh connection first. Edit your `~/.ssh/config` like so:


```shell
Host myhostname
    HostName 192.168.1.1
    User root
    IdentitiesOnly
```

Now you can edit `inventory.yml` to look like this:

```yaml
all:
  hosts:
    myhostname:
```

Make sure to copy your SSH public key to your server and enable passwordless login.

Now, edit the file at `common/vars/main.yml`. Change the values are you see fit.

Rename the file at `common/templates/example.com.conf` and set it to `yourdomain.com.conf`.

Now edit the file at `plausible/vars/main.yml` and set the values as you like.

After having setup all the variables, you can encrypt your variables files like so:

```shell
ansible-vault encrypt common/vars/main.yml
ansible-vault encrypt plausible/vars/main.yml
```

If you encrypt your variables, edit `Makefile` and set `COMMON_DEFAULT_ASK_VAULT_PASS` and
`PLAUSIBLE_DEFAULT_ASK_VAULT_PASS` to True.

Run `make` and the play should start.

Once the play is complete, your plausible instance should be accessible at *yourdomain.com*.

### Things to note

- Passwords must be hashed using `mkpasswd -m sha-512`

## Support and feature requests

Feel free to request support and features on the Github issue tracker.

## License and Copyright

License is MIT.

Copyright 2022 Josh Michael karamuth