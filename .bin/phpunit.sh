#!/bin/sh
function phpunit_color() {
  /usr/bin/phpunit $1 2>&1 | phpunit-redgreen
};
phpunit_color $1
