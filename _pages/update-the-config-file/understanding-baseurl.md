---
title: Understanding the `baseurl:` Property
---
__It isn't necessary to update `baseurl:` yourself in most cases. This
section is not necessary to follow through with the reset of the
instructions.__

The `baseurl:` configuration property affects the root URL of your guide when
served locally on your machine. When published on [BC Agile
Guides](http://guides-template.pathfinder.gov.bc.ca/), the `baseurl:` automatically sets to the
name of your repository, so you don't have to do that yourself.

For example, when run locally, the URL for this guide is
`http://localhost:4000/`. In production, the URL is
`http://guides-template.pathfinder.gov.bc.ca/.

The URLs of the individual section pages are relative to the `baseurl:`. For
example, the `permalink:` of this page is `{{page.url}}`. The full local
URL is `http://localhost:4000{{page.url}}`, and in
production it's `http://guides-template.pathfinder.gov.bc.ca/guides-template{{page.url}}`.

### Change the `baseurl:` when serving locally

If you you do change the `baseurl:` property in the `_config.yml` file,
**remember to include the trailing '`/`' when serving locally**. The Jekyll
built-in webserver doesn't redirect to it automatically.
