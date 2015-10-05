# CETL Website

[![Build Status](https://travis-ci.org/pzi/middleman-basis.svg?branch=master)](https://travis-ci.org/pzi/middleman-basis)

> Basis comes with a bare minimum of pre-installs, ready for you to take it to the next level.
It is literally, the Basis for building a good, performant website.


## General Information

 * [middleman][middleman-url]
 * [bower][bower-url]
 * [humans.txt][humanstxt-url]
 * [ImageOptim][imageoptim-url]


### Description

The Basis for building a good, performant website. Middleman Basis uses:

* COMPASS
* Haml
* Sass
* CoffeeScript
* Bower
* Modernizr.js
* Normalize.css
* Search Engine Sitemap
* ImageOptim
* Humans.txt

## Deploy

*develop*

```
divshot push; divshot promote development production; divshot open

```

*production*

```
middleman deploy -b

```

## Getting Started

Before you get started, make sure you have [node.js][nodejs-url] & [Bower][bower-url] already installed.

1. Install **middleman-basis** as Middleman template.

    ```bash
    git clone https://github.com/pzi/middleman-basis.git ~/.middleman/middleman-basis
    ```

2.  Initialize a new Middleman project with the **middleman-basis** template

    ```bash
    middleman init project_name --template=middleman-basis
    cd project_name
    ```

3. Install Bower packages: `bower install`

4. Install required gems: `bundle install`

5. Run `middleman`
