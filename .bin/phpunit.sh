#!/bin/sh
function phpunit_color() {
  /usr/bin/phpunit $1 2>&1 | redgreen
};
phpunit_color $1
