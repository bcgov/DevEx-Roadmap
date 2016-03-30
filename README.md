## BC Agile Guide Template

This is a skeleton repo containing the
[CFPB/DOCter](https://github.com/CFPB/DOCter)-based
[Jekyll](http://jekyllrb.com/) template for
[BC Gov Guides](http://guides.pathfinder.govb.ca/).

### Getting started - Approach 1 - Only Requires git
 
To create a new guide, where `fancy-new-guide` is the name of your new repository:

* create a new repo on GitHub. (Since we're prentending it's called 'fancy-new-guide' and it's in the bcgov organization, the repo's URL is https://github.com/bcgov/fancy-new-guide.git)


```shell
$ git clone --bare https://github.com/bcgov/guides-template.git

$ cd guides-template.git
$ git push --mirror https://github.com/bcgov/fancy-new-guide.git

$ cd ..
$ rm -rf guides-template.git

$ git clone https://github.com/bcgov/fancy-new-guide.git
```

### Getting started - Approach 2 - Requires ruby install

If you're ruby-savvy and you've followed "Approach 2" below, you can follow the instructions [here](http://guides-template.pathfinder.gov.bc.ca/github-setup/).
 
```shell
$ git clone https://github.com/bcgov/guides-template.git MY-NEW-GUIDE
$ cd MY-NEW-GUIDE
```

You can then serve your guide locally using one of the approaches below. 
 
### Serve your Guide Locally - Approach 1 - Docker/Kitematic

#### Set up Kitematic

You may want to preview your guide as you are working on the content.  We provide a pretty simple way to do this via [Docker](https://www.docker.com/) To get set up to preview your guide as you are working on it, follow the steps below:
 
 * install [Kitematic](https://kitematic.com/)
 * launch Kitematic
 * click the "DOCKER CLI" button at the bottom left of the Kitematic window ![Kitematic Docker CLI](/images/kitematic-docker-cli.png?raw=true)
 * type:
 
 ```shell
  cd <location of your guide repo>
  ```
 
 * type:
 
 ```shell
 docker build --tag guide:latest --file Dockerfile-local ./
 ```
 
 * then type:
 
 ```shell
  docker run -p 4000:4000 -d -v $PWD:/guide --name guide guide:latest
  ```
  
 * open your web browser to [http://192.168.99.100:4000/](http://192.168.99.100:4000/) and you should see the latest version of your guide as it will appear when published.
  
At this point, as you update content and want to see the results reflected in the preview site, you can do the following:

* select your container from the Container list on the right hand column of the Kitematic app (it will be labelled "guide"). ![Kitematic Container List](/images/kitematic-container-list.png?raw=true)
* click the "Restart" button in the Kitematic app. (We'd prefer to have published content auto-updated without restarting, but haven't quite nailed that yet.) ![Kitematic Restart Button](/images/kitematic-restart-button.png?raw=true)

### Serve your Guide Locally - Approach 2 - Local Ruby + Jekyll Install 

#### Installing Ruby

You will need [Ruby](https://www.ruby-lang.org) ( > version 2.1.5 ). To check
whether it's already installed on a UNIX-like system, open up a terminal
window (e.g. Terminal on OS X) and type `ruby -v` at the command prompt. For
example, you should see something similar to the following:

```shell
$ ruby -v
ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]
```

If the version number is less than 2.1.5, or instead you see something like:

```shell
$ ruby -v
-bash: ruby: command not found
```

Then Ruby is not installed, and you should choose one of the installation
methods below. [The "Installing Ruby" page of the official
Ruby language web
site](https://www.ruby-lang.org/en/documentation/installation/) explains how
to do this in a number of ways across many different systems.

##### Quickest Ruby install/upgrade for OS X

On OS X, you can use [Homebrew](http://brew.sh/) to install Ruby in
`/usr/local/bin`, which may require you to update your `$PATH` environment
variable:

```shell
$ brew update
$ brew install ruby
```

##### Optional: using a version manager

Whether or not Ruby is already installed, we strongly recommend using a Ruby
version manager such as [rbenv](https://github.com/sstephenson/rbenv) or
[rvm](https://rvm.io/) to help ensure that Ruby version upgrades don't mean
all your [gems](https://rubygems.org/) will need to be rebuilt.

##### Serve the Guide locally

To serve serve the locally, where `MY-NEW-GUIDE` is the name
of your new repository:

```shell
$ cd MY-NEW-GUIDE
$ ./go serve
```

The `./go` script will check that your Ruby version is supported, install the
[Bundler gem](http://bundler.io/) if it is not yet installed, install all the
gems needed by the template, and launch a running instance on
`http://localhost:4000/`.

### Follow the template instructions

The Guides Template (either [running locally](http://localhost:4000) or the
[published version](http://guides-template.pathfinder.gov.bc.ca/)) will walk you
through the rest of the steps to edit and publish your guide.

### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0
>dedication. By submitting a pull request, you are agreeing to comply
>with this waiver of copyright interest.
