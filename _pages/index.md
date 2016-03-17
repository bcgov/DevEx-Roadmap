---
permalink: /
title: Getting Started
---
Use the contents of this GitHub repository as a template to create [BC Agile Guides](http://guides-template.pathfinder.gov.bc.ca/). It's structured like an [18F] (https://pages.18f.gov/) Guides guide,
and it walks you through the process of creating and publishing a guide based on
the same theme.

The template is derived from [CFPB/DOCter](https://github.com/CFPB/DOCter).
It uses [Jekyll](http://jekyllrb.com/) as the rendering engine.

### Creating a New Guide

To get started on a new guide (or other document based on this theme), 
follow [the "Getting started" instructions in the bcgov/guides-template GitHub
repository](https://github.com/bcgov/guides-template/#getting-started) to create
a local clone of this template.

Once you've created a clone, click the _Add a New Page_ entry in the table of
contents to begin the rest of the steps.


## Viewing a Guide Locally

You may want to preview your guide as you are working on the content.  We provde a pretty simple way to do this via [Docker](https://www.docker.com/) To get set up to preview your guide as you are working on it, follow the steps below:
 
 * install [Kitematic](https://kitematic.com/)
 * launch Kitematic
 * click the "DOCKER CLI" button at the bottom left of the Kitematic window <img src="{{site.baseurl}}/images/kitematic-docker-cli.png" alt="Kitematic Docker CLI">
 * type:
 {% highlight shell %}
  cd <location of your guide repo>
  {% endhighlight %}
 * type:
 {% highlight shell %}
 docker build --tag guide:latest --file Dockerfile-local ./
 {% endhighlight %}
 * then type:
 {% highlight shell %}
  docker run -p 4000:4000 -d -v $PWD:/guide --name guide guide:latest
  {% endhighlight %}
 * open your web browser to [http://192.168.99.100:4000/](http://192.168.99.100:4000/) and you should see the latest version of your guide as it will appear when published.
  
At this point, as you update content and want to see the results reflected in the preview site, you can do the following:

1. Select your container from the container list on the right hand column of the Kitematic app (it will be labelled "guide"). <img src="{{site.baseurl}}/images/kitematic-container-list.png" alt="Kitematic Container List">
2. Click the "Restart" button in the Kitematic app. (We'd prefer to have published content auto-updated without restarting, but haven't quite nailed that yet.) <img src="{{site.baseurl}}/images/kitematic-restart-button.png" alt="Kitematic Restart Button">

### Updating an Existing Guide/Document

__Note: You need to do this only if your existing guide or document is not already
using the `guides_style_18f` gem or if it does not have an `18f-pages`
branch.__

Add the [`guides_style_18f` gem](https://github.com/18F/guides-style) to your
guide's `Gemfile`, if it's not already present. You may also wish to copy the
`./go` script from the template if your document doesn't already have one.

To receive layout updates, as well as any new styles or scripts associated
with them, you will need to run `./go update_theme`. Or — if you aren't using
a `./go` script — you can run `bundle update --source guides_style_18f`
manually.)

If your repository already has a `gh-pages` branch, you can create an
`18f-pages` branch from it by running these commands:

```
$ git checkout -b 18f-pages gh-pages
$ git push origin 18f-pages
```

Follow the instructions in _Update the Config File_ to update your
`_config.yml` accordingly. You may also need to consult the _GitHub Setup_ and
_Post Your Guide_ chapters to ensure your guide is correctly published to
`https://github.com/bcgov` and linked from the main [BC Agile
Guides](http://guides-template.pathfinder.gov.bc.ca/) site.
