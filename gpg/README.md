## gpg shortcuts

<br>

(adapted from [bt3gl's 20216 guide](https://coderwall.com/p/ajtlqa/getting-started-with-pgp-gpg))


1. create a key (choose RSA with 4096):

```
gpg --full-generate-key
```

<br>

2. share the public key with:
```
gpg --armor --export > public-key.asc
```

<br>

3. upload to some keyservers, such as ubuntu or MIT:
```
gpg --send-keys --keyserver keyserver.ubuntu.com KEYID
gpg --keyserver hkp://pgp.mit.edu --send-key KEYID
```

<br>

4. backup the private key:
```
gpg --export-secret-keys --armor KEYID > priv.asc
```

<br>

5. list your keys:
```
gpg --list-keys
gpg --list-secret-keys
```

<br>

6. clean up if needed:
```
gpg --delete-secret-key KEYID
gpg --delete-key KEYID
```

<br>

7. finally, you should upload your key into official servers such as **[ubuntu](https://keyserver.ubuntu.com/)** or **[mit](https://pgp.mit.edu/)**.




