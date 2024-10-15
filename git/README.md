## useful git stuff

<br>

---

### reset all commits

<br>

##### check out to a temporary branch:

```
git checkout --orphan TEMP_BRANCH
```

##### add all the files:

```
git add -A
```

##### commit the changes:

```
git commit -am "(:"
```

##### delete the old branch:

```
git branch -D main
```

##### rename the temporary branch to `main`:

```
git branch -m main
```

##### finally, force update to our repository:

```
git push -f origin main
```

<br>

---

### reverting back to an older commit

<br>

```shell
git reset --hard HEAD~N
```

or

```shell
git reset --hard COMMIT
```

and then

```shell
git push origin master --force
```


<br>


---

### delete all local branches

<br>

```shell
git branch | grep -v "main" | xargs git branch -D 
```

<br>

---

### troubleshooting

<br>

##### error: RPC failed; HTTP 400 curl 22 The requested URL returned error: 400

```shell
git config http.postBuffer 524288000
```

<br>



