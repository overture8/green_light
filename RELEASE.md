# Release Documentation

After a commit the version should be bumped based on semver i.e.

* Bug fix - update 0.0.x
* Non API breaking change - update 0.x.0
* API breaking change - update x.0.0

First, the version should be updated in the version.rb file. Then, it should be
tagged with git.

The flow should be this.

```shell
git pull origin master
git add . && git commit -am "message"
git tag vX.X.X # Following semver instructions above.
git push origin master
git push --tags
# travis is set up to publich the npm on a successful build (see .travis.yml)
```

